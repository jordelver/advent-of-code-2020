input =
  File.read("input.txt").split("\n")
    .map do |line|
      occurances, letter, password = line.split(" ")
      lower, upper = occurances.split("-")
      [lower, upper, letter[0], password]
    end

total =
  input.count do |(lower, upper, letter, password)|
    password.scan(letter).size.between?(lower.to_i, upper.to_i)
  end

puts total
