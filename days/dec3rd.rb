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
  index = 0

  o2 = binaries
  co2 = binaries
  puts "a #{index} #{o2.count} #{co2.count}"

  until o2.count == 1 && co2.count == 1
    _col_mask = ''
    (0...binaries.length).each do |row|
      _col_mask += binaries[row][index]
    end

    most = _col_mask.count('1') >= _col_mask.count('0') ? '1' : '0'
    least = (!!most[index]).to_s.to_i.to_s
    
    o2.select!{|x| x[index] == most } if o2.count > 1
    co2.select!{|x| x[index] == least } if co2.count > 1

    index += 1
    #puts "a #{index} #{o2.count} #{co2.count}"
  end
  [o2, co2]
end

p solvePart2 binaries