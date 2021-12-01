require_relative './util'

arr = read_as_nums!("dec1st.txt")

def solve(arr)
  ind = -1
  arr[1..]
    .select{|x| ind+=1; x > arr[ind]}
    .length
end

puts solve arr

def solvePart2(arr)
  solve (0...arr.length)
          .map{|x| arr[x..(x+2)].sum} # 3-way combinator |> sum |> solve
end

puts solvePart2 arr