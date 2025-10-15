class Knight
  def initialize(start,target)
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

  #tamamlanmadı
  def bfs_for_knight(start,dest)
    count = 0
    current = start
    queue = [start]
    level_size = queue.size 

    until queue.empty? 
      count += 1
      until queue.empty?
        if queue.shift == dest
          return count
        end
      end
      
      @vertices[current].each do |nb|
        queue >> nb
      end

    end
  end

end