require 'spass'

describe SPass do
  describe "#initialize" do
    it "correctly sets dict_path" do
      path = File.expand_path('/usr/share/dict/words')
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
    before(:all) do
      # TODO: Use test dict with relatively few lines
      @sp = SPass.new
    end

    it "is >= 1" do
      10.times do
        @sp.random_line.should be >= 1
      end
    end

    it "is <= number of lines" do
      10.times do
        @sp.random_line.should be <= @sp.dict_lines
      end
    end
  end


  describe "#random_ascii_word" do
    before(:all) do
      @sp = SPass.new
    end

    it "only includes lowercase letters" do
      10.times do
        @sp.random_ascii_word.should =~ /^[a-z]+$/
      end
    end
  end

  describe "#generate" do
    before(:all) do
      @sp = SPass.new
    end

    it "is at least the given length" do
      [10, 15, 20, 25, 30, 35, 40].each do |len|
        @sp.generate(len).length.should be >= len
      end
    end
  end
end

