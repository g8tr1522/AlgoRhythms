-- find_beats(beats, invert)
-- 
-- gets positions of beats 
-- uses `lam.basic.find_index` as a backend
-- 
-- returns `pos`, `vals`, and `count` unless `beats` is a number (then unpack `pos` and `vals`)
-- 
-- argument `invert` is optional
--  --When it is `true`
--			then get the positions that wouldn't be returned by `find_beats` (if `invert` was nil)
--		For example, if `find_beats` would return {1,2,4}, 
--      make it instead return {3,5} (if the size was 5)
--  --When it is a number, 
--			then find positions of all beats from `beats` to `invert` (inclusive)
--    A third arg can be specified which acts as the regular `invert` arg
-- 
-- 
-- 

-- future: 
--	- improve vararg handling
--	- when beats is a table, we can improve the search 
--    Right now, we search through all of `rhythm` for each val passed to `beats`
--    we can improve the search by only searching for 'nearby' values (kinda like in `insert_beats`)
--
--

local find_index = lam.basic.find_index
local is_sorted  = lam.basic.is_sorted
local ssub = string.sub

return function (self, ...)
-- handle vararg
	local args = {...}
	
	local beats = args[1]
	local return_inverse = args[2] or false
	
	local to = 0	
	if #args==3 then
		to = args[2]
		if args[3]==true then
			return_inverse = true
		end
	end
	
-- declare locals	
	local rhythm = self:get('r')
	local pos, vals, count = {},{},0 -- positions
	--local return_inverse
	
-- construct `pos` based on argument config
	local type_beats = ssub( type(beats), 1,1)
	
	if type_beats=="n" then --number
		if not to then
			pos, vals, count = find_index(rhythm, beats, true)	--passing `true` unpacks the return args
		else
			pos, vals, count = find_index(rhythm, 
					function (v)
						if beats<=v and v<=to then
							return true
						end
					end
				)
		end
		
	elseif type_beats=="t" then --table
		if not is_sorted(beats) then
			error("beats must be sorted"
				,2)
		end
		for b=1,#beats do
			local beat = beats[b]
			local c = 0
			pos[#pos+1], vals[#vals+1], c = find_index(rhythm, beat, true)	--passing `true` unpacks the return args
			count = count + c
		end
	
	elseif type_beats=="f" then	--function
		pos, vals, count = find_index(rhythm, beats)
	end
	
-- now decide whether to invert `pos` or not
	if not return_inverse then
		return pos, vals, count
	else
		-- construct new positions and new vals
		local new_pos, vals = {},{} -- new positions
		local p,np = 1,1  -- loop counters for `pos` and `new_pos`
		for i=1,#rhythm do
			if i~=pos[p] then
				new_pos[np] = i
				vals[np] = rhythm[i]	-- this line prevents us from having to write a second loop
				np = np+1
			else				
				p = p+1
			end
		end
		
		return new_pos, vals, np
	end
end
