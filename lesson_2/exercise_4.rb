# Заполнить хеш гласными буквами, где значением будет являтся
# порядковый номер буквы в алфавите (a - 1).

# Способ 4. each_with_index (остальной код оставлю себе для справки)
vowels = %w[а е и о у ы э я]

vowels_hash = {}
('а'..'я').to_a.each_with_index do |letter, index|
  if vowels.include? letter
    vowels_hash[letter] = index + 1
  end
end

puts vowels_hash
# # Способ 1 - через slice
# Hash[('а'..'я').to_a.map(&:to_sym).zip((1..32).to_a)].slice(:а, :е, :и, :о, :у, :ы, :э, :я)
#
# # Способ 2 - через select
# Hash[('а'..'я').to_a.zip((1..32).to_a)].select { |k,v| vowels.include? k }
#
# # Способ 3 - через цикл
# all_letters = Hash[('а'..'я').to_a.zip((1..32).to_a)]
#
# vowels_hash = {}
# vowels.each do |letter|
#   vowels_hash[letter] = all_letters[letter]
# end
