$dir = File.expand_path File.dirname(__FILE__)
require "#{$dir}/../cantor.rb"
require "byebug"

describe Cantor do
  it "should have an empty domain when the constructor is offered a zero" do
    c = Cantor.new(0)
    expect(c.domain.empty?).to eq true
  end

  it "should have 0 and 1 if given a 1" do
    c = Cantor.new(1)
    expect(c.domain).to eq []
  end

  it "should have 0, 0.5 and a 1 if given a 2" do
    c = Cantor.new(2)
    expect(c.domain).to eq [0.0, 1.0]
  end

  it "should have a 100 items for a constructor given 100" do
    c = Cantor.new(100)
    expect(c.domain.size).to eq 100
    expect(c.domain.first).to eq 0
    expect(c.domain.last).to eq 1
  end

  it "should have a to_b_3 method that converts a number to base 3" do
    c = Cantor.new(1)
    expect(c.to_b_3(0).to_s).to eq 0.to_s
    expect(c.to_b_3(1).to_s).to eq 1.0.to_s
    expect(c.to_b_3(2).to_s).to eq 2.0.to_s
    expect(c.to_b_3(3).to_s).to eq 10.0.to_s
    expect(c.to_b_3(4).to_s).to eq 11.0.to_s
    #expect(c.to_b_3(0.1).to_s).to eq 0.0022.to_s 
  end

  it "should have a replace_all_digits_after_first_1_with_zero which does that" do
    c = Cantor.new(1)
    a = c.replace_all_digits_after_first_1_with_zero(0.12345).to_f
    expect(a).to eq 0.1
    expect(c.replace_all_digits_after_first_1_with_zero(0.00123).to_f).to eq 0.00100
    expect(c.replace_all_digits_after_first_1_with_zero(1.00123).to_f).to eq 1.00100
    expect(c.replace_all_digits_after_first_1_with_zero(100123).to_f).to eq 100123
    expect(c.replace_all_digits_after_first_1_with_zero(100.23).to_f).to eq 100.23
  end

  it "should have a replace_all_2s_with_1s which does that" do
    c = Cantor.new(1)
    expect(c.replace_all_2s_with_1s(0.00123)).to eq 0.00113.to_s
    expect(c.replace_all_2s_with_1s(0.002201 )).to eq 0.001101.to_s
    expect(c.replace_all_2s_with_1s(1.002201 )).to eq 1.001101.to_s
  end

  it "should have a b_to_10 which converts from binary to base 10" do
    c = Cantor.new(1)
    expect(c.b_to_10(0.1)).to eq 0.5
    expect(c.b_to_10(0.01)).to eq 0.25
    expect(c.b_to_10(0.0101)).to eq 0.3125
  end

  it "should have a to_cantor function" do
    c = Cantor.new(1)
    expect(c.to_cantor(0.25) - 0.3333 ).to be <= 0.0001
  end

  it "should produces n+1 cantor numbers" do
    c = Cantor.new(100)
    expect(c.domain.size).to be == 100
    expect(c.range.size).to be  == 100
  end

  it "should produces the cantor function" do
    c = Cantor.new(100)
    c.plot
  end

end
