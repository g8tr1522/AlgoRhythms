-- make new measure object


local rhythm_methods = AlgoRhythms.methods  or require('src/rhythm_methods')
local measures       = AlgoRhythms.measures or require('src/mesaures')


local new = function(argt)
-- initialize object
	local o = {}
	
	o.rhythm = argt.table or argt.rhythm or {}
	o.converted = {}
	o.mantissa_of_converted = {}
	--o.delay_column = o.mantissa_of_converted
	o.associated = {}
	
-- constants needed to get conversion
	argt.upper_bound = argt.ub or argt.upper_bound
	o.upper_bound = (argt.upper_bound - AlgoRhythms.globals.PROGRAMMERS_NOTATION_OFFSET) or false
	
	argt.conversion_offset = argt.offset or argt.co or argt.conversion_offset or argt.conv_offset or 0
	o.conversion_offset = argt.conversion_offset or AlgoRhythms.globals.DEFAULT_CONVERSION_OFFSET
	
	argt.conversion_factor = argt.cf or argt.conv_factor or argt.conversion_factor or false
	if argt.conversion_factor==false then
		if renoise then
			argt.conversion_factor = renoise.song().patterns[1].number_of_lines
			print("~~~ Conversion factor was automatically set to ", o.conversion_factor)
		else
			print("=== Warning!!! Conversion factor must be set to do conversions!")
		end
	end
	o.conversion_factor = argt.conversion_factor
	
-- set inheritance and indexing
	argt.index_converted = argt.index_converted or true
	
	local mt =
		{__index = 
			function(t,k)
				if type(k)=="number" then          -- numerical indexing
					if t.index_converted then
						return t.converted[k]
					else
						return t.rhythm[k]
					end
				else                               -- method call
					if       measures[k] then
						return measures[k]
					elseif   rhythm_methods[k] then
						return rhythm_methods[k] 
					end
				end
			end
		} 
	
	setmetatable(o, mt)
	
	o.new = function () return nil; end
-- end
	return o
end



return new