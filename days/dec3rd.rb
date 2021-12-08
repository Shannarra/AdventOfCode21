# frozen_string_literal: true

require_relative '../util'

binaries = read_file('dec3rd.txt')

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
def solve(binaries)
  gamma = ''
  epsilon = ''
  index = 0

  while index < binaries[0].length
    col_mask = ''
    (0...binaries.length).each do |col|
      col_mask += binaries[col][index]
    end
    gamma += col_mask.count('1') > col_mask.count('0') ? '1' : '0'
    epsilon += gamma[index] == '1' ? '0' : '1'

    index += 1
  end

  gamma.to_i(2) * epsilon.to_i(2)
end

p solve binaries

# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

def solve_part2(binaries)
  mask_for = lambda { |selection, index|
    mask = ''
    selection.each { |x| mask += x[index] }
    mask
  }

  index = 0

  o2 = binaries
  co2 = binaries.clone

  until o2.count == 1 && co2.count
    col_mask = mask_for.call(o2, index)

    most = col_mask.count('1') >= col_mask.count('0') ? '1' : '0'

    col_mask = mask_for.call(co2, index)
    least = col_mask.count('1') >= col_mask.count('0') ? '0' : '1'

    o2.select! { |x| x[index] == most } if o2.count > 1
    co2.select! { |x| x[index] == least } if co2.count > 1

    index += 1
  end

  o2.first.to_i(2) * co2.first.to_i(2)
end

p solve_part2 binaries

# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
