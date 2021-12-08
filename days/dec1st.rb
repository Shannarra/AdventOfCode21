# frozen_string_literal: true

require_relative '../util'

arr = read_as_nums!('dec1st.txt')

def solve(arr)
  ind = -1
  arr[1..]
    .select do |x|
    ind += 1
    x > arr[ind]
  end
    .length
end

puts solve arr

def solve_part2(arr)
  solve(0...arr.length)
    .map { |x| arr[x..(x + 2)].sum } # 3-way combinator |> sum |> solve
end

puts solvePart2 arr
