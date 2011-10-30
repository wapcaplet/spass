
class SPass
  attr_reader :dict_path, :dict_lines

  def initialize(dict_path='/usr/share/dict/words')
    @dict_path = File.expand_path(dict_path)
    if !File.file?(@dict_path)
      raise RuntimeError, "Cannot find dict file: #{@dict_path}"
    end
    @dict_lines = `wc -l #{@dict_path}`.split.first.to_i
  end

  # Return a random line number from 1..N where N is the last line
  # in the dict file
  def random_line
    rand(@dict_lines) + 1
  end

  # Return a random word from the dictionary, lowercased
  def random_word
    cmd = "sed -n '#{random_line} {p;q;}' '#{@dict_path}'"
    `#{cmd}`.chomp.downcase
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

