require_relative '../util'

def solve(hash)
  hash["forward"] * (hash["down"] - hash["up"])
end

p solve read_as_num_hash!("dec2nd.txt")

def solvePart2(pairs)
  aim = 0; depth = 0; hor_pos = 0

  pairs.each do |pair|
    units = pair.last.to_i
    case pair.first
    when "up"
      aim -= units
    when "down"
      aim += units
    else #fwd
      hor_pos += units
      depth += (aim * units)
    end
  end

  hor_pos * depth
end

p solvePart2 read_as_pairs!('dec2nd.txt')
p read_as_num_hash!('dec2nd.txt')