# I realize this is less than ideal
slope = File.readlines("input.txt", chomp: true).drop(1).map { |l| l * 100 }

def route(slope, right:, down:)
  right_position = 0

  slope.map.with_index do |current_line, line_number|
    if (line_number % down).zero?
      right_position += right
      current_line[right_position]
    end
  end
end

def trees(route)
  route.join.scan(/#/)
end

# part 1
route_taken = route(slope, right: 3, down: 1)
puts trees(route_taken).size

# part 2
positions = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]

routes = positions.map do |(right, down)|
  route_taken = route(slope, right: right, down: down)
  trees(route_taken).size
end

puts routes.inspect
puts routes.reduce(:*)
