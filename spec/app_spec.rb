require "app"

describe App do
  context "reading file" do
    let(:line) { File.readlines("webserver.log")[10] }

    it "has a file to read from" do
      expect { File.open("webserver.log") }.not_to raise_error
    end

    it "can read lines of URL + IP pairs from file" do
      expect(line.split.size).to eq(2)
    end
  end

  context "printing views counts" do
    it "prints something to the console" do
      expect { App.new("webserver.log").run }.to output.to_stdout
    end
  end
end