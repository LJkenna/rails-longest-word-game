array = ('a'..'z').to_a
array1 = array.map { |word| word.delete("a", '') }
p array
p array1
