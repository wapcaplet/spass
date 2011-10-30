require 'spass'

TEST_DICT = File.expand_path('../data/ten_words', __FILE__)

describe SPass do
  before(:each) do
    @sp = SPass.new(TEST_DICT)
  end


  describe "#initialize" do
    it "correctly sets dict_path" do
      path = TEST_DICT
      @sp = SPass.new(path)
      @sp.dict_path.should == path
    end

    it "raises an exception for invalid path" do
      path = File.expand_path('non/existent/path')
      lambda do
        @sp = SPass.new(path)
      end.should raise_error(RuntimeError, /Cannot find dict file/)
    end
  end


  describe "#random_line" do
    it "is >= 1" do
      100.times do
        @sp.random_line.should be >= 1
      end
    end

    it "is <= number of lines" do
      100.times do
        @sp.random_line.should be <= @sp.dict_lines
      end
    end
  end


  describe "#random_word" do
    it "only returns words from the dict" do
      100.times do
        @sp.random_word.should =~ /one|two|three|four|five|six|seven|eight|nine|ten/
      end
    end
  end


  describe "#random_ascii_word" do
    it "only includes lowercase letters" do
      10.times do
        @sp.random_ascii_word.should =~ /^[a-z]+$/
      end
    end
  end

  describe "#generate" do
    it "is at least the given length" do
      [10, 15, 20, 25, 30, 35, 40].each do |len|
        @sp.generate(len).length.should be >= len
      end
    end
  end
end

