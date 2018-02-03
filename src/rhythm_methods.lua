rhythm_methods = {}
local _root = 'src/rhythm_methods/'



rhythm_methods.insert_beats            = require(_root..'insert_beats')
	rhythm_methods.insert                  = rhythm_methods.insert_beats 
rhythm_methods.remove_beats            = require(_root..'remove_beats')
	rhythm_methods.remove                  = rhythm_methods.remove_beats 
rhythm_methods.find_beats              = require(_root..'find_beats')








return rhythm_methods