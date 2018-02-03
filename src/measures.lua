
Measures = {}
local _root = 'src/measures/'



--Measures.new                 = require(_root..'new')
--Measures.copy                = require(_root..'copy')

Measures.set                 = require(_root..'set')
Measures.get                 = require(_root..'get')
Measures.convert             = require(_root..'convert')
Measures.convert_mantissa    = require(_root..'convert_mantissa')
Measures.printinfo           = require(_root..'printinfo')
Measures.__len               = require(_root..'__len')


-- functions that use the `associated` table
--Measures.a_reset             = require(_root..'reset')
--Measures.a_sort              = require(_root..'sort')
-- and functions that alter it
--Measures.a_repeat            = require(_root..'repeat')
--Measures.a_swap              = require(_root..'swap')


--Measures.insert_beats        = require(_root..'insert_beats')







return Measures