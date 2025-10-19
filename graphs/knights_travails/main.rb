require_relative 'lib/knight.rb'

knight = Knight.new
knight.create_vertices()
puts knight.find_shortest([0,0],[3,3])