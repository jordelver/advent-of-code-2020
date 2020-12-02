input =
  File.read("input.txt").split("\n")
    .map do |line|
      positions, letter, password = line.split(" ")
      first, second = positions.split("-").map(&:to_i)
      [first, second, letter[0], password]
    end

total =
  input.count do |(first, second, letter, password)|
    [password[first - 1] == letter, password[second - 1] == letter].one?
  end

puts total
