input = File.read("input.txt").split.map(&:to_i)
input.permutation(3).each do |group|
  total = group.sum
  if total == 2020
    puts group.inject(:*)
    break
  end
end
