-- force beats to a certain rhythm
-- useful for creating triplets, but can be used for any division

local copy_sequence = AlgoRhythms.copy_sequence
local algo = function (rhythm, index, snap_to, anchor)
	
	
	


return function (self, argt)
-- extract tables from object
	local rhythm = copy_sequence(self.rhythm)
	local assc = copy_sequence(self.associated)
	
-- handle default args
	argt.start     = argt[1] or argt.start or argt.at
	argt.sel       = argt[2] or argt.sel or argt.select
	argt.div       = argt[3] or argt.div or argt.divisions or 1/3 -- automatically do triplets
	argt.anchor    = argt.anchor or true 
	argt.collision = argt.collision or 'o'  -- overwrite or intermingle with existing beats if we fall past them

-- decide which indices to work on
	local indices = {}
	if type(argt.start)=="table" then
		indices = argt.start
	elseif type(argt.start)=="number" then
		if type(argt.sel)=="number" then
			for i=1,argt.sel do
				indices[i] = argt.start - 1
			end
		elseif type(argt.sel)=="table" then
			for i=1,#argt.sel do
				indices[i] = argt.sel[i] - 1
			end
		end
	elseif not argt.start and type(argt.sel)=="table" then
		indices = argt.sel
	end
	
-- create table of rhythms that we work on
	local rhythms = {}
	for i,v in ipairs(indices) do
		rhythms[i] = rhythm[v]
	end
	
-- decide anchor value
	local anchor_to = rhythms[1]
	if argt.anchor==false then
		anchor_to = 0
	elseif argt.anchor==true then
		anchor_to = rhythms[1]
	elseif type(argt.anchor)=="number" then
		anchor_to = argt.anchor
	end
	
-- decide divisions
	local divisions = {}
	if type(argt.div)=="number" then
		for i=1,#indices do
			divisions[i] = argt.div
		end
	elseif type(argt.div)=="table" then
		if #argt.div == #indices then
			divisions = argt.div
		else
			error("length of `div` must be the same length as selected values"
				,2)
		end
	end
	
	
		
		
	
	
	
	
	
	
	
