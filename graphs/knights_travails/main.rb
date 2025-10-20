require_relative 'lib/knight.rb'

knight = Knight.new
knight.create_vertices()
knight.find_shortest([0,0],[7,7])