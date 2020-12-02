input = File.read("input.txt").split.map(&:to_i)
input.permutation(2).each do |pair|
  total = pair.sum
  if total == 2020
    puts pair.inject(:*)
    break
  end
end
