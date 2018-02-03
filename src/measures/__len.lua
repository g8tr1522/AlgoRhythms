-- __len metatmethod
--
-- returns length the `rhythm`, `converted`, and `associated` tables


return function (self)
	if #self.rhythm == #self.associated then
		return #self.rhythm
	else
		return false
	end
end
