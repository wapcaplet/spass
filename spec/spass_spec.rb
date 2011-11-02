require 'spass'

TEST_DICT = File.expand_path('../data/ten_words', __FILE__)

describe Generator do
  before(:each) do
    @sp = Generator.new(TEST_DICT)
  end


  describe "#initialize" do
    it "returns an array of lines from the given file" do
      @sp = Generator.new(TEST_DICT)
      @sp.dict.should == [
        'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten']
    end

    it "only returns words matching a regex" do
      @sp = Generator.new(TEST_DICT, :allowed=>/^t/)
      @sp.dict.should == ['two', 'three', 'ten']
      @sp = Generator.new(TEST_DICT, :allowed=>/^f/)
      @sp.dict.should == ['four', 'five']
      @sp = Generator.new(TEST_DICT, :allowed=>/e$/)
      @sp.dict.should == ['one', 'three', 'five', 'nine']
    end

    it "only returns words with N chars or fewer" do
      @sp = Generator.new(TEST_DICT, :chars=>3)
      @sp.dict.should == ['one', 'two', 'six', 'ten']
    end

    it "raises an exception when the file does not exist" do
      lambda do
        Generator.new(File.expand_path('non/existent/path'))
      end.should raise_error(RuntimeError, /Cannot find dict file/)
    end
  end


  describe "#random_word" do
    it "only returns words from the dict" do
      100.times do
        @sp.random_word.should =~ /one|two|three|four|five|six|seven|eight|nine|ten/
      end
    end
  end


  describe "#random_number" do
    it "returns a number between 0 and 9" do
      100.times do
        num = @sp.random_number
        num.should be >= 0
        num.should be <= 9
      end
    end
  end


  describe "#generate" do
    it "has the given number of words" do
      [1, 2, 3, 4, 5, 6].each do |words|
        phrase = @sp.generate(words)
        phrase.split.count.should == words
      end
    end

    it "includes digits when :digits is true" do
      10.times do
        @sp.generate(24, :digits=>true).should =~ /^([a-z]+[0-9] ?)+$/
      end
    end
  end
end

