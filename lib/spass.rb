
class Generator
  attr_reader :dict, :chars, :allowed, :file
  # Create a Generator using the given word dictionary
  def initialize(file='/usr/share/dict/words', options={})
    @file = file
    @allowed = options[:allowed] || /^[a-z]+$/
    @chars = (options[:chars] || 10).to_i
    @dict = read_dict
  end

  # Read a word dictionary from the given file, and return an array
  # of elements that match the allowed regex. Raise an exception if
  # the given dictionary file cannot be found.
  def read_dict
    if !File.file?(@file)
      raise RuntimeError, "Cannot find dict file: #{@file}"
    end
    dict = []
    IO.readlines(@file).each do |line|
      line.strip!
      if line.length <= @chars && line =~ @allowed
        dict << line
      end
    end
    return dict
  end

  # Return a random word from the dictionary
  def random_word
    @dict[rand(@dict.count)]
  end

  # Return a random number from 0 to 9
  def random_number
    rand(10)
  end

  # Generate a passphrase with the given number of words
  def generate(num_words, options={})
    words = []
    num_words.times do
      word = random_word
      word += random_number.to_s if options[:digits]
      words << word
    end
    return words.join(' ')
  end
end

