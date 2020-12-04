batch_file = File.read("input.txt").split("\n\n")
  .map do |line|
    line
      .split(" ")
      .map { |data| data.split(":") }.to_h
  end

required_passport_keys = ["eyr", "hgt", "pid", "ecl", "byr", "hcl", "iyr"]

valid_passports = batch_file.count do |passport|
  (required_passport_keys & passport.keys) == required_passport_keys
end

puts valid_passports
