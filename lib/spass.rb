
class SPass
  def initialize(dict_path='/usr/share/dict/words')
    @dict_path = dict_path
    @dict_lines = `wc -l #{@dict_path}`.split.first.to_i
  end

  # Return a random word from the dictionary, lowercased
  def random_word
    %x[sed -n '#{rand(@dict_lines)} {p;q;}' '#{@dict_path}'].chomp.downcase
  end

  # Return a random word that consists of only lowercase letters
  def random_ascii_word
    word = random_word
    while word =~ /[^a-z]/
      word = random_word
    end
    return word
  end

  # Generate a passphrase of at least the given length in characters
  def generate(length)
    phrase = ''
    while phrase.length < length
      phrase += random_ascii_word + ' '
    end
    return phrase.chomp
  end
end

