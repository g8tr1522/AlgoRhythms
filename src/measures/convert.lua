-- convert rhythm to pattern lines (or whatever)


return function (self, rhythm_table, UB, factor, post_offset)
	UB          = self.upper_bound or UB or error("please provide uppper bound (argument 3)", 2)
	post_offset = self.conversion_offset or post_offset or 0
	factor      = self.conversion_factor or factor
	--local pre_offset = AlgoRhythms.globals.PROGRAMMERS_NOTATION_OFFSET
	
	local rhythm_table = rhythm_table or self.rhythm
	local converted = {}
	--local index = 0
	for i=1,#rhythm_table do
		--index = index + 1
		-- if rhythm_table[i]==false then
			-- converted[i] = false
		-- else
			--converted[i] = (rhythm_table[i] - pre_offset)/(UB - pre_offset) * factor + post_offset
			converted[i] = (rhythm_table[i])/(UB) * factor + post_offset
		--end
	end
	
	self.converted = converted
	return converted
end

