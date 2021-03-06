# These is a just to make the map
# easier for me to read. "M" is
#visually more dense than "o"

M = 'land'
o = 'water'

world =    [[M,o,o,o,o,o,o,o,o,o,M],
			[o,o,o,o,M,M,o,o,o,o,o],
			[o,o,o,o,o,o,o,o,M,M,o],
			[o,o,o,M,o,o,o,o,o,M,o],
			[o,o,o,M,o,M,M,o,o,o,o],
			[o,o,o,o,M,M,M,M,o,o,o],
			[o,o,o,M,M,M,M,M,M,M,o],
			[o,o,o,M,M,o,M,M,M,o,o],
			[o,o,o,o,o,o,M,M,o,o,o],
			[o,M,o,o,o,M,o,o,o,o,o],
			[M,o,o,o,o,o,o,o,o,o,M]]

def continent_size world, x, y
	if world[x][y] != 'land'
		# Either it's water or we already
		# counted it, but either way, we don't
		# want to count it now.
		return 0
	end

	size = 1
	world[x][y] = 'counted land'

	# ...then we count all of the 
	#   neighboring eight tiles (and,
	#	of course, their neighbors by
	#   way of the recursion).

	size = size + continent_size(world, x-1, y-1)
	size = size + continent_size(world, x  , y-1)
	size = size + continent_size(world, x+1, y-1)
	size = size + continent_size(world, x-1, y  )
	size = size + continent_size(world, x+1, y  )
	size = size + continent_size(world, x-1, y+1)
	size = size + continent_size(world, x  , y+1)
	size = size + continent_size(world, x+1, y+1)
	
	
	size
end

puts continent_size(world, 5, 5)