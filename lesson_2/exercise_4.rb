# Заполнить хеш гласными буквами, где значением будет являтся
# порядковый номер буквы в алфавите (a - 1).

vowels = %w(а е и о у ы э я)

# Способ 1 - через slice
Hash[('а'..'я').to_a.map(&:to_sym).zip((1..32).to_a)].slice(:а, :е, :и, :о, :у, :ы, :э, :я)

# Способ 2 - через select
Hash[('а'..'я').to_a.zip((1..32).to_a)].select { |k,v| vowels.include? k }

# Способ 3 - через цикл
all_letters = Hash[('а'..'я').to_a.zip((1..32).to_a)]

vowels_hash = {}
vowels.each do |letter|
  vowels_hash[letter] = all_letters[letter]
end
