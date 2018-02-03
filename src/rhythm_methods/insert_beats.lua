-- inserts a new beat at the correct index. 
-- Has several options for how to handle the associated table

print()
print("in insert_between, 'lam'       is  :", tostring(lam))
print("in insert_between, 'is_sorted' is  :", tostring(lam.basic.is_sorted))
print()

--local add            = require(_lamroot..'src/basic_methods/transformers/add')
local is_sorted      = lam.basic.is_sorted --require(_lamroot..'src/basic_methods/selectors/is_sorted')
--local is_all_same    = require(_lamroot..'src/basic_methods/selectors/is_all_same')
local insert_between = lam.basic.insert_between --require(_lamroot..'src/basic_methods/selectors/insert_between')
local tinsert = table.insert
local tremove = table.remove


local algo = function (rhythm, beats, overwrite, rhythms_upper_bound)
	
	local r=0
	while rhythm[r+1] and rhythm[r+1]<=beats[1] do
		r = r+1
	end
	--r=r-1
	
	local eb, equal_beats = 0, {
		vals = {},
		idx_beats  = {},
		idx_rhythm = {},
	}
	
	-- local b = 1 --`beats` indexer
	-- local ii, insertions = r,{}
	
	-- while beats[b] do --rhythm[r]<beats[b] do
		-- if    beats[b] == rhythm[r] then
			-- eb = eb + 1
			-- equal_beats.vals[eb]        = rhythm[r] 
			-- equal_beats.idx_beats[eb]   = b
			-- equal_beats.idx_rhythm[eb]  = r
			-- eb = eb + 1
			-- b  = b  + 1
		-- elseif beats[b] > rhythm[r] then
			-- r = r + 1
			-- insertions[b] = r + b	- eb
		-- elseif beats[b] > rhythm[r] then
			-- inserts[
	-- end
	
	print("~~~ performing algo")
	local insertions, removals = {},{}
	local b=1
	while beats[b] do
		local beat = beats[b]
		local rhy = rhythm[r]
		local rhy_next = rhythm[r+1] or rhythms_upper_bound
		
		print("  ~ testing for ...")
		print(string.format("    %8g < %8g < %8g", rhy, beat, rhy_next))
		
		if beat == rhy then
			eb = eb + 1
			insertions[b] = false
		elseif rhy<beat and beat<rhy_next then
			insertions_val = r + b - eb
			if overwrite then
				insertions_val = insertions_val - (#removals)
			end
			insertions[b] = insertions_val
		else
			print("    ",beat,"is not less than", rhy_next)
			b = b - 1
			r = r + 1
			removals[#removals+1] = r 
		end
		
		b = b + 1
	end
	
	return insertions, removals, eb
end



return function (self, beats, assc_option, overwrite)
-- handle input args	
	if overwrite~=false or overwrite==nil then
		overwrite = true
	end
	--print("overwrite is", overwrite)
	
	if type(beats)=="number" then
		beats = {beats}
	end
	if not is_sorted(beats) then
		error("beats must be sorted")
	end
	
-- get local copies of `rhythm` and `associated` properties
	local rhythm = self:get('r')
	local assc   = self:get('a')
	
	if not is_sorted(rhythm) then
		error("rhythm property isn't sorted!", 2)
	end
	
-- perform algo, get insertion and removal points
	--print("-- about to perform algo")
	local insertions, removals = algo(rhythm, beats, overwrite, self.upper_bound)
	--print("-- algo was successful")
	
-- remove beats that are overalpped by the new ones
	if overwrite then
		print()
		for i=#removals,1,-1 do	-- these should be removed in reverse order
			print("removing `rhythm["..tostring(removals[i]).."]` = ",rhythm[removals[i]])
			tremove(rhythm,removals[i])
		end
	end
	--print("-- loop 3 successful")
	
-- insert new beats
	for i=1,#insertions do
		local idx = insertions[i]
		print("inserting beat "..tostring(beats[i]).." at index ",idx)
		if idx then
			tinsert(rhythm, idx, beats[i])
		end
	end
	print()
	--print("-- loop 4 successful")
	
-- now set the properties in self
	self.associated = assc
	self:set( rhythm )
	
	return #removals, eb
end
