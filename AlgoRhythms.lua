
AlgoRhythms = {}

local _mainroot = _algorhythms_root or ''  -- folder that "AlgoRhythms.lua" is kept in
--local _src_root = _mainroot .. 'src/'



--=============================================================================
-- globals

-- global constants
AlgoRhythms.globals = {
	PROGRAMMERS_NOTATION_OFFSET = 1,  -- should only be 0 (for programmers) or 1 (for traditional)
	DEFAULT_CONVERSION_OFFSET = 0,
	DEFAULT_MANTISSA_MULTIPLIER = 255,
	--DEFAULT_MEASURE_COUNT_UPPER_BOUND = 4
	
	-- GLOBAL_SWING = 0
}

-- global functions (for loading)
local unpack = table.unpack or unpack

_lamroot = _mainroot .. 'LuaArrayMethods/'
local lam = require(_lamroot..'lam')

AlgoRhythms.copy_sequence = function (t) -- used to make references (and not copies) to sequences
	local rt = {}
	for i=1,#t do   rt[i] = t[i]   end
	return rt
end

--=============================================================================
-- include the rest of the stuff here

AlgoRhythms.methods    = require('src/rhythm_methods')
AlgoRhythms.measures   = require('src/measures')

	AlgoRhythms.new        = require('src/measures/new')




return AlgoRhythms
