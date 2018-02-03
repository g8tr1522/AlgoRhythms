-- remove beats from measures object
-- 
-- 
-- argt specifies removal mode:
--	- positions      : elements that should be removed
--  - matching       : if a beat matches the values, remove it
--  - between/and    : (dual argument) remove beats between beats A and B
--  - matching_assoc : remove beats which match any in associated (not implemented yet)
-- 
-- 
-- 



local ssub = string.sub
local coerce2table = function (argt_key)
	local type_string = type(argt_key)
	type_string = ssub(type_string, 1,1)
	if type_string=='n' then
		return {argt_key}
	elseif type_string=='t' then
		return argt_key
	else
		error("type of args passed to remove must be a table or a number"
			,3)
	end
end

local tsort = table.sort
--local RIFAF = function (self, table_of_indices)  -- RemoveIndicesFromAllFields
	-- this function 



return function (self, argt)
-- collect args from aliases and adjust into tables if necessary
	-- positions
	argt.positions  = argt.pos
	               or argt.positions
	               or argt.indices
	               or argt.idx
                 or argt.index
	argt.positions  = coerce2table(argt.positions)
	
	-- beats
	argt.matching   = argt.beats 
	               or argt.matching 
                 or argt.matching_beats
	argt.matching   = coerce2table(argt.matching)
	tsort(argt.matching)
	
	-- between/and
	argt.between    = argt.between 
	               or argt.from
	               or argt.btn
                 or argt.b
                 or argt.btwn
	argt.and        = argt.and
	               or argt.to
                 or argt.a
	--
	-- matching associated table
	argt.associated = argt.associated
	-- (no implementation yet)
	
-- relevant locals
	local rhythm = self:get('r')
	local remove_which = {} -- store indices we will remove into this table
	
-- construct `remove_which` 
	if argt.positions then
		remove_which = argt.positions
	elseif argt.matching then
		local matching = argt.matching
		local start_at = 1 -- index at which to start search in inner loop
		for m=1,#matching do
			local mval = matching[m]
			for r=start_at,#rhythm do
				if rhythm[r]==mval then
					remove_which[#remove_which + 1] = r
				elseif 
		
		
		local ry,rm,m = 1,1,1 --loop indices for `rhythm`, `remove_which`, and `matching`
		
		while matching[m] do
			
			if rhythm[r]~=matching[m] 
		
	
	
