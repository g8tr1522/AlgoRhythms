-- remove the fractional parts of the values from `converted`
-- convert those to integers
-- store them in `self.mantissa_of_converted`
--
--

local floor = math.floor


return function (self, temp_converted, multiplier)
	local temp_converted = temp_converted or self.converted
	
	local multiplier = multiplier or AlgoRhythms.globals.DEFAULT_MANTISSA_MULTIPLIER
	local mantissa_table = {}
	
	for i=1,#temp_converted do
		local v = temp_converted[i]
		local mantissa = v%1
		temp_converted[i] = floor(v)
		
		mantissa_table[i] = floor( mantissa * multiplier )
	end
	
	self.mantissa_of_converted = mantissa_table
	return mantissa_table
end