baggage_rules = File.read("input.txt").split("\n")
baggage_rules = File.read("valid.txt").split("\n")

# find all bag colours that can contain a shiny gold bag directly
# make a colour based list
#
# find all sub-bags contained within others using that list
#
# answer is 4 for valid.txt

parent_bag_pattern = /^(?<bag>.+) bags contain (?<contained>.*).$/
child_bag_pattern  = /(?<quantity>\d+) (?<colour>.+) bag/

bags =
  baggage_rules.reduce([]) do |acc, rule|
    match_data = parent_bag_pattern.match(rule)

    bag = match_data.named_captures["bag"]
    contained = match_data.named_captures["contained"]

    more_bags =
      contained.split(", ").map do |child|
        child_matches = child_bag_pattern.match(child)

        next if child_matches.nil?

        # For the full key/value use child_matches.named_captures
        child_matches.named_captures["colour"]
      end

    acc << [bag, more_bags.compact]
  end

def traverse(obj, parent, &blk)
  case obj
  when Array
    obj.each { |parent, child| traverse(parent, child, &blk) }
  else
    blk.call(obj, parent)
  end
end

x = []

pp bags

puts

traverse(bags, nil) do |parent, child|
  puts parent.inspect
  puts child.inspect
  puts

  if child.include?("shiny gold")
    x << parent
  end
end

puts x.inspect
