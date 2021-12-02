DEF_FOLDR = "../inputs"

def read_file(file, foldr = DEF_FOLDR)
  open("#{foldr}/#{file}")
    .readlines
    .map(&:chomp)
end

def read_as_nums!(file, foldr = DEF_FOLDR)
  read_file(file, foldr)
    .map(&:to_i)
end

def read_as_pairs!(file, foldr = DEF_FOLDR)
  read_file(file, foldr).map(&:split)
end

def read_as_hash!(file, foldr = DEF_FOLDR)
  read_as_pairs!(file, foldr) unless block_given?

  read_as_pairs!(file, foldr)
    .each_with_object({}) do |x, h|
    h[x[0]] ||= 0
    h[x[0]] += yield x[1] if block_given?
  end
end

def read_as_num_hash!(file, foldr = DEF_FOLDR)
  read_as_hash!(file, foldr){|x| x.to_i}
end

def read_as_arr_hash!(file, foldr = DEF_FOLDR)
  read_as_hash!(file, foldr){|x| x[1]}
end
