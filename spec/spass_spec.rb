require 'spass'

TEST_DICT = File.expand_path('../data/ten_words', __FILE__)

describe Generator do
  before(:all) do
    @sp = Generator.new(TEST_DICT)
  end


  describe "#read_dict" do
    it "returns an array of lines from the given file" do
      @sp.read_dict(TEST_DICT).should == [
        'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten']
    end

    it "only returns lines matching a regex" do
      @sp.read_dict(TEST_DICT, /^t/).should == ['two', 'three', 'ten']
      @sp.read_dict(TEST_DICT, /^f/).should == ['four', 'five']
      @sp.read_dict(TEST_DICT, /e$/).should == ['one', 'three', 'five', 'nine']
    end

    it "raises an exception when the file does not exist" do
      path = File.expand_path('non/existent/path')
      lambda do
        @sp.read_dict(path)
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


  describe "#generate" do
    it "is at least the given length" do
      [10, 15, 20, 25, 30, 35, 40].each do |len|
        10.times do
          @sp.generate(len).length.should be >= len
        end
      end
    end
  end
end

