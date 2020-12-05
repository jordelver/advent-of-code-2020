def bsearch(boarding_pass, range:)
  boarding_pass.reduce(range) do |memo, letter|
    lower, upper = memo.each_slice(memo.size / 2).to_a

    case letter
    when "F" then lower
    when "B" then upper
    when "L" then lower
    when "R" then upper
    end
  end.join.to_i
end

boarding_passes = File.read("input.txt").split.map { |bp| bp.split(//) }

# part 1
seat_ids = boarding_passes.map do |boarding_pass|
  row     = bsearch(boarding_pass[0, 7], range: (0..127).to_a)
  column  = bsearch(boarding_pass[7, 3], range: (0..7).to_a)
  seat_id = (row.to_i * 8) + column
  seat_id
end

puts seat_ids.sort.last

# part 2
puts (46..991).to_a - seat_ids
