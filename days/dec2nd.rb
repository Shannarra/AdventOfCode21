# frozen_string_literal: true

require_relative '../util'

def solve(hash)
  hash['forward'] * (hash['down'] - hash['up'])
end

p solve read_as_num_hash!('dec2nd.txt')

# rubocop:disable Metrics/MethodLength
def solve_part2(pairs)
  aim = 0
  depth = 0
  hor_pos = 0

  pairs.each do |pair|
    units = pair.last.to_i
    case pair.first
    when 'up'
      aim -= units
    when 'down'
      aim += units
    else # fwd
      hor_pos += units
      depth += (aim * units)
    end
  end

  hor_pos * depth
end

p solve_part_2 read_as_pairs!('dec2nd.txt')

# rubocop:enable Metrics/MethodLength
