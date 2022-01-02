require "takeaway"

describe Takeaway do
  let(:menu) { double(:menu, :list => "Breakfast £2", :dishes => { "Breakfast" => "2" }) }
  subject { Takeaway.new(menu) }

  context "menu functionalities" do
    
    it "has a menu" do
      expect(subject).to have_attributes(:menu => menu)
    end

    it "shows the menu" do
      expect { subject.show_menu }.to output("Breakfast £2").to_stdout 
    end
  end

  context "order functionalities" do
    it "starts an order" do
      subject.add_to_order("Breakfast")
      expect(subject.instance_variable_get(:@order)).to be_truthy
    end

    it "gives error if non existent dish is ordered" do
      expect { subject.add_to_order("Toast") }.to raise_error("Sorry, this dish is not available")
    end
  end
end 
