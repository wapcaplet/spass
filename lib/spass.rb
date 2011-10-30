DICT_PATH = '/usr/share/dict/words'
DICT_LINES = `wc -l #{DICT_PATH}`.split.first.to_i

class SPass
  # Return a random word from the dictionary, lowercased
  def self.random_word
    %x[sed -n '#{rand(DICT_LINES)} {p;q;}' '#{DICT_PATH}'].chomp.downcase
  end

  # Return a random word that consists of only lowercase letters
  def self.random_ascii_word
    word = random_word
    while word =~ /[^a-z]/
      word = random_word
    end
    return word
  end

  # Generate a passphrase of at least the given length in characters
  def self.generate(length)
    phrase = ''
    while phrase.length < length
      phrase += random_ascii_word + ' '
    end
    return phrase.chomp
  end
end

