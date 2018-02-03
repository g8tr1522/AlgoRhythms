-- snap beats to nearest beat division
-- 
-- 
-- 
-- 


local range = lam.make.range
local closest_to = lam.basic.closest_to
local insert = table.insert


return function (self, argt)
-- handle default arguments
	argt.sel = argt.sel or argt.select or argt.at
	argt.div = argt.div or argt.division
	argt.collision = argt.collision or false
	
-- create locals
	local rhythm = self.rhythm
	local assc = self.associated
	
-- create grid from divisions
	local grid = range(0, self.upper_bound - argt.div, argt.div)
	
-- decide which beats to work on 
	local indices = {}
	if type(argt.sel)=="table" then
		indices = argt.sel
	elseif type(argt.sel)=="number" then
		if not argt.next then
			indices = {argt.sel}
		else
			for i=1,argt.next do
				indices[i] = argt.sel + i - 1
			end
		end
	end
	
-- perform algorithm
	if argt.next then
		local old_beat = rhythms[indices[i]]
		local _, grid_index = closest_to(grid, old_beat)
		if type(argt.next)=="number" then
			for i=1,argt.next do
				rhythms[indices[i]] = grid[grid_index + i-1]
			end
		else
			for i=1,#argt.next do
				rhythms[indices[i]] = grid[grid_index + argt.next[i]-1]
			end
		end
		
		
	elseif not argt.next then
		for i=1,#indices do
			local old_beat = rhythms[indices[i]]
			local new_beat = closest_to(grid, old_beat)
			local between_beats, between_indices, equal_indices = closest_to(rhythm, new_beat, 2)
			if #equal_indices > 0 then
				new_beat = old_beat
			else
				insert(rhythms, between_indices
