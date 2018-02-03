-- set the `rhythm` which also sets the `converted` property

--local convert = require('src/measures/convert')

--print("convert method location: ", tostring(AlgoRhythms.measures.convert))

return function (self, t)
	local pre_offset = AlgoRhythms.globals.PROGRAMMERS_NOTATION_OFFSET
	for i=1,#t do
		t[i] = t[i] - pre_offset
	end
	
	self.rhythm = t
	self:convert(t)
	self:convert_mantissa()
end
	