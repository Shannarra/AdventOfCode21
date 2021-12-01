def read_file(file, foldr = "./inputs")
  open("#{foldr}/#{file}")
    .readlines
    .map(&:chomp)
end

def read_as_nums!(file, foldr = "./inputs")
  read_file(file, foldr)
    .map(&:to_i)
end