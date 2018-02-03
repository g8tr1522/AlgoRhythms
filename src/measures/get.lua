

local add   = lam.basic.add
local copy  = lam.basic.copy
-- local copy = function (t)
	-- local rt = {}
	-- for i=1,#t do
		-- local rt[i] = t[i]
	-- end
	-- return rt
-- end


return function (self, str, idx)
	str = str or 'r'
	str = string.sub(str, 1,1)
	
	local rt = {}
	if str=='r' then
		rt = copy(self.rhythm)
		rt = add(rt, 1)
	elseif str=='c' then
		rt = copy(self.converted)
		if idx then
			return math.floor(rt[idx])
		end
	elseif str=='m' then
		rt = copy(self.mantissa_of_converted)
	elseif str=='a' then
		rt = copy(self.associated)
	end
	
	if idx then
		return rt[idx]
	else
		return rt
	end
end

