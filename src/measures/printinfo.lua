-- prints out info for a measure

local unpack = unpack or table.unpack


return function (self, options)
	options = options or 'all'
	
	
	
	if options=='all' then
		print("~~~ I am object ("..tostring(self)..") from the AlgoRhythms.Measures class!")
		print("  ~ self.rhythm         = ", unpack(self:get('r'))              )
		print("  ~ self.converted      = ", unpack(self.converted)             )
		print("  ~ self.delay_column   = ", unpack(self.mantissa_of_converted) )
		print("  ~ self.associated     = ", unpack(self.associated)            )
		print()
	end
end
