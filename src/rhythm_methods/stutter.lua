-- makes a beat have a echo/delay effect

return function (self, argt)
	argt.index = argt.index = argt.at or argt.rhythm_index or argt.anchor
	argt.count = argt.count or argt.number_of_times or argt.times or argt.NoT or argt.not
	argt.div = argt.division or argt.div or argt.beat or argt.with_beat or argt.with_count
	argt.overwrite_mode = true
	
-- get local rhythm and assc
	local rhythm = self.rhythm
	local assc = self.associated
	
-- construct beats to insert
	local anchor = rhythm[argt.index]
	local extra_beats, insert_at, _ = {}, {}, {}
	for i=1,argt.count do 
		extra_beats[i] = anchor + i*argt.div
		_,insert_at = 
	