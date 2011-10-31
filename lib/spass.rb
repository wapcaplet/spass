
class Generator
  # Create a Generator using the given word dictionary, returning
  # only words that match the given regular expression
  def initialize(dict_path='/usr/share/dict/words', allowed=/^[a-z]+$/)
    @allowed = allowed
    @dict = read_dict(dict_path, allowed)
    @dict_path = dict_path
  end

  # Read a word dictionary from the given file, and return an array
  # of elements that match the allowed regex. Raise an exception if
  # the given dictionary file cannot be found.
  def read_dict(path, allowed=/^.+$/)
    if !File.file?(path)
      raise RuntimeError, "Cannot find dict file: #{path}"
    end
    dict = []
    IO.readlines(path).each do |line|
      if line =~ allowed
        dict << line.strip.downcase
      end
    end
    return dict
  end

  # Return a random word from the dictionary
  def random_word
    @dict[rand(@dict.count)]
  end

  # Generate a passphrase of at least the given length in characters
  def generate(length)
    phrase = ''
    while phrase.length < length + 1 # to account for trailing space
      phrase += random_word + ' '
    end
    return phrase.chomp
  end
end

