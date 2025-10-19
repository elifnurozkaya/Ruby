class Knight
  attr_accessor :vertices
  def initialize()
    @visited_vertices = []
    @vertices = {}
    @moves = [
      [2, 1], [2, -1], [-2, 1], [-2, -1],
      [1, 2], [1, -2], [-1, 2], [-1, -2]
    ]
    end

  def create_vertices
    (0..7).each do |x|
      (0..7).each do |y|
        position = [x,y] 
        @vertices[position] = self.all_valid_moves(position,@moves)
      end
    end
  end

  
  def all_valid_moves(pos,moves)
    x,y = pos
    valid_moves = []

    moves.each do |dx,dy|
      n_x = x + dx
      n_y = y + dy

      if n_x.between?(0,7) && n_y.between?(0,7)
        valid_moves << [n_x,n_y]
      end
    end
    valid_moves
  end

  #returns the shortest paths level
  def bfs_for_knight(start,dest)
    count = -1
    current = start
    queue = [start]
    

    until queue.empty?
      count += 1
      level_size = queue.size 

      level_size.times do 
        current = queue.shift
        @visited_vertices << current 

        if current == dest
          return count
        end

        vertices[current].each do |val|
          queue << val unless @visited_vertices.include?(val)
        end
        
      end
      
    end
  end

  def find_shortest(start,dest)
    level = self.bfs_for_knight(start,dest)
    if level == 0
      return [start]
    end

    @visited_vertices = []

    path = []
    queue = [start]
    current = start
    control = 0

    level_size = queue.size

    while true
    control = 0
    path = []
      while control != level
        control += 1
        level_size = queue.size 
        level_size.times do 
            current = queue.shift
            @visited_vertices << current 
            path << current
    
            if current == dest
              return path
            end
    
            vertices[current].each do |val|
              queue << val unless @visited_vertices.include?(val)
            end
            
          end
      end
    end
  end

end