require "calculator"
# spec/calculator_spec.rb
RSpec.describe Calculator do
  describe ".to_decimal" do
    context "given an empty string" do
      it "should return an error" do
        expect { described_class.to_decimal("") }.to raise_error(StandardError)
      end
    end
    context "given valid roman numerals" do
      it "should return the correct decimals" do
        expect(described_class.to_decimal("X")).to eql(10)
        expect(described_class.to_decimal("XIX")).to eql(19)
        expect(described_class.to_decimal("IV")).to eql(4)
        expect(described_class.to_decimal("XXXVI")).to eql(36)
        expect(described_class.to_decimal("-XXI")).to eql(-21)
        expect(described_class.to_decimal("XXXX")).to eql(40)
        expect(described_class.to_decimal("viii")).to eql(8)
      end
    end
    context "given invalid roman numerals" do
      it 'should return an error' do
        expect { described_class.to_decimal("HELLO") }.to raise_error(StandardError)
        expect { described_class.to_decimal("XXXG") }.to raise_error(StandardError)
      end
    end
  end

  describe "to_roman" do
    context "given valid decimals" do
      it "should return the correct roman numerals" do
        expect(described_class.to_roman(19)).to eq "XIX"
        expect(described_class.to_roman(40)).to eq "XXXX"
        expect(described_class.to_roman(999)).to eq "IM"
        expect(described_class.to_roman(14)).to eq "XIV"
        expect(described_class.to_roman(1732)).to eq "MDCCXXXII"
      end
    end
    context "given invalid inputs" do
      it "should raise an error" do
        expect { described_class.to_roman("hello") }.to raise_error(StandardError)
      end
    end
  end

  describe ".add" do
    context "given empty strings" do
      it "should returns an error" do
        expect { described_class.add("", "") }.to raise_error(StandardError)
      end
    end
    context "given valid inputs" do
      it "should give the correct answer" do
        expect(described_class.add("VIII", "x")).to eq "XVIII"
      end
    end
  end

  describe ".sub" do
    context "given empty strings" do
      it "should returns an error" do
        expect { described_class.sub("", "") }.to raise_error(StandardError)
      end
    end
    context "given valid inputs" do
      it "should give the correct answer" do
        expect(described_class.sub("VIII", "x")).to eq "-II"
      end
    end
  end

  describe ".mult" do
    context "given empty strings" do
      it "should returns an error" do
        expect { described_class.mult("", "") }.to raise_error(StandardError)
      end
    end
    context "given valid inputs" do
      it "should give the correct answer" do
        expect(described_class.mult("VIII", "x")).to eq "LXXX"
        expect(described_class.mult("VIII", "-II")).to eq "-XVI"
      end
    end
  end

  describe ".div" do
    context "given empty strings" do
      it "should returns an error" do
        expect { described_class.div("", "") }.to raise_error(StandardError)
      end
    end
    context "given valid inputs" do
      it "should give the correct answer" do
        expect(described_class.div("VIII", "x")).to eq "0"
        expect(described_class.div("XXV", "V")).to eq "V"
      end
    end
  end

  describe ".mod" do
    context "given empty strings" do
      it "should returns an error" do
        expect { described_class.mod("", "") }.to raise_error(StandardError)
      end
    end
    context "given valid inputs" do
      it "should give the correct answer" do
        expect(described_class.mod("VIII", "x")).to eq "VIII"
        expect(described_class.mod("XXV", "V")).to eq "0"
      end
    end
  end
end
