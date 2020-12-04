batch_file = File.read("input.txt").split("\n\n")
  .map do |line|
    line
      .split(" ")
      .map { |data| data.split(":") }.to_h
  end

validations = {
  "byr" => ->(value) { (1920..2002) === value.to_i },
  "ecl" => ->(value) { %w(amb blu brn gry grn hzl oth).include?(value) },
  "eyr" => ->(value) { (2020..2030) === value.to_i },
  "hcl" => ->(value) { !!(value =~ /\A#[0-9,a-f]{6}\z/) },
  "hgt" => ->(value) { _, amount, unit = value.to_s.split(/(\d{2,3})(cm|in)/)
                       case unit
                       when "in"
                         (59..76) === amount.to_i
                       when "cm"
                         (150..193) === amount.to_i
                       end
                     },
  "iyr" => ->(value) { (2010..2020) === value.to_i },
  "pid" => ->(value) { !!(value =~ /\A\d{9}\z/) },
}

valid_passports = batch_file.count do |passport|
  validations.keys.all? do |key|
    validations.fetch(key).call(passport[key])
  end
end

puts valid_passports
