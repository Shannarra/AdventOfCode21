require_relative '../util'

binaries = read_file('dec3rd.txt')

def solve(binaries)
  gamma, epsilon, index = "", "",0

  while index < binaries[0].length
    _col_mask = ''
    (0...binaries.length).each do |col|
      _col_mask += binaries[col][index]
    end
    gamma += _col_mask.count('1') > _col_mask.count('0') ? '1' : '0'
    epsilon += gamma[index] == '1'  ? '0' : '1'

    index+=1
  end

  gamma.to_i(2) * epsilon.to_i(2)
end

p solve binaries

def solvePart2(binaries)

  def mask_for(selection, index)
    mask = ''
    selection.each{|x| mask += x[index] }
    mask
  end

  index = 0

  o2 = binaries
  co2 = binaries.clone

  until o2.count == 1 && co2.count
    _col_mask = mask_for(o2, index)

    most = _col_mask.count('1') >= _col_mask.count('0') ? '1' : '0'

    _col_mask = mask_for(co2, index)
    least = _col_mask.count('1') >= _col_mask.count('0') ? '0' : '1'

    o2.select!{|x| x[index] == most } if o2.count > 1
    co2.select!{|x| x[index] == least} if co2.count > 1

    index += 1
  end

  o2.first.to_i(2) * co2.first.to_i(2)
end

p solvePart2 binaries