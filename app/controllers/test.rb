array_const = ('A'..'Z').to_a - %w[A E I U O] + ('A'..'Z').to_a - %w[A E I U O]
array_vowel = %w[A E I U O]
@letters = array_const.sample(7) + array_vowel.sample(3)
p @letters
