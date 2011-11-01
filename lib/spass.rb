
class Generator
  # Create a Generator using the given word dictionary, returning
  # only words that match the given regular expression
  def initialize(dict_path='/usr/share/dict/words', options={})
    @dict_path = dict_path
    @dict = read_dict(dict_path, options)
  end

  # Read a word dictionary from the given file, and return an array
  # of elements that match the allowed regex. Raise an exception if
  # the given dictionary file cannot be found.
  def read_dict(path, options={})
    allowed = options[:allowed] || /^[a-z]+$/
    chars = (options[:chars] || 10).to_i
    if !File.file?(path)
      raise RuntimeError, "Cannot find dict file: #{path}"
    end
    dict = []
    IO.readlines(path).each do |line|
      line.strip!
      if line.length <= chars && line =~ allowed
        dict << line
      end
    end
    return dict
  end

  # Return a random word from the dictionary
  def random_word
    @dict[rand(@dict.count)]
  end

  # Return a random number from 1 to 99
  def random_number
    1 + rand(99)
  end

  # Generate a passphrase of at least the given length in characters
  def generate(length, options={})
    phrase = ''
    while phrase.length < length + 1 # to account for trailing space
      phrase += "#{random_word} "
      phrase += "#{random_number} " if options[:digits]
    end
    return phrase.chomp
  end
end

