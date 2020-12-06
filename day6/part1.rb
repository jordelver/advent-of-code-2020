answers = File.read("input.txt").split("\n\n")

# part 1
answered =
  answers.sum do |group|
    group.split.join.chars.uniq.sum do |person|
      person.chars.size
    end
  end

puts answered

# part 2
answered_only_yes =
  answers
    .map { |group| group.split }
    .sum do |group_answers|
      group_answers.join.chars.tally.select do |_, total_answers|
        total_answers == group_answers.size
      end.keys.size
    end

puts answered_only_yes
