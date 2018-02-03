-- inserts a new beat at the correct index. 
-- Has several options for how to handle the associated table


local is_sorted = require(_lamroot..'src/basic_methods/selectors/is_sorted')
local insert_between = require(_lamroot..'src/basic_methods/selectors/insert_between')
local tinsert = table.insert


return function (self, beat, assc_option)
	local rhythm = self:get('r')
	local assc   = self:get('a')
	
	if not is_sorted(rhythm) then
		error("rhythm property isn't sorted!", 2)
	end
	
-- insert beat into rhythm
	local insert_at = 0
	rhythm, insert_at = insert_between(rhythm, beat)
	
-- decide which element in assc to duplicate based off of the `assc_option` arg
	local assc_copy_index = 0  -- which element in `assc` will we copy?
	if assc_option then
		if type(assc_option)=="number" then
			assc_copy_index = assc_option
		elseif assc_option=='p'            --previous
			assc_copy_index = insert_at - 1
		elseif assc_option=='a'            --at
			assc_copy_index = insert_at
		elseif assc_option=='n'            --next
			assc_copy_index = insert_at + 1
		end
	else
		assc_copy_index = insert_at
	end
	
-- insert element into `associated`
	tinsert(assc, assc_copy_index, assc[assc_copy_index])
	
-- now set the properties in self
	self.associated = assc
	self:set( rhythm )
	
	return insert_at
end
