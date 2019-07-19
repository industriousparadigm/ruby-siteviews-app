require "page_view"

describe PageView do
  let(:index123a) { PageView.new("/homepage", "123.456.789.000") }
  let(:index123b) { PageView.new("/homepage", "123.456.789.000") }
  let(:about123) { PageView.new("/about", "123.456.789.000") }
  let(:contact123) { PageView.new("/contact", "123.456.789.000") }
  let(:index777) { PageView.new("/homepage", "777.456.789.000") }
  let(:about777) { PageView.new("/about", "777.456.789.000") }
  let(:index456) { PageView.new("/homepage", "456.456.789.000") }
  let(:about456) { PageView.new("/about", "456.456.789.000") }
  let(:contact456) { PageView.new("/contact", "456.456.789.000") }
  let(:about101a) { PageView.new("/about", "101.456.789.000") }
  let(:about101b) { PageView.new("/about", "101.456.789.000") }
  let(:about101c) { PageView.new("/about", "101.456.789.000") }

  context "instantiation" do
    it "has a URL attribute" do
      expect(index777.url).not_to be_nil
    end
  
    it "has an IP attribute" do
      expect(index777.ip).not_to be_nil
    end

    it "cannot be instantiated without exactly two attributes" do
      expect { PageView.new("/index") }.to raise_error(ArgumentError)
      expect { PageView.new }.to raise_error(ArgumentError)
      expect { PageView.new("/index", "123.456.789.000", "moo") }.to raise_error(ArgumentError)
    end
  end

  context "format" do
    it "URL is a string starting with a slash" do
      expect(index777.url).to start_with("/") & be_a(String)
    end

    it "IP is exactly four 3-digit numbers separated by a dot" do
      expect(index777.ip).to be_a(String)
      
      index777_ip = index777.ip.split(".")
      expect(index777_ip.size).to eq(4)

      index777_ip.each do |number|
        expect(number.size).to eq(3)
        expect(number.scan(/\D/)).to be_empty
      end
    end
  end

  context "class methods" do
    describe ".sort_by_views" do
      it "returns a hash" do
        expect(PageView.sort_by_views).to be_a(Hash)
      end
      it "returns amount of views as a value of a given URL key" do
        expect(PageView.sort_by_views["/homepage"]).to eq(4)
      end
      # TODO
      # it "returns values sorted descending" do
      #   
      # end
    end
    describe ".sort_by_unique_views" do
      it "returns a hash" do
        expect(PageView.sort_by_unique_views).to be_a(Hash)
      end
      xit "returns amount of unique views as a value of a given URL key" do
        expect(PageView.sort_by_unique_views["/homepage"]).to eq(3)
      end
      # TODO
      # it "returns values sorted descending" do
        
      # end
    end
  end


end
