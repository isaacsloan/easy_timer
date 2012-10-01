require 'spec_helper'

describe "timer instance" do
	let(:verbose_time){Time.at(694861.111111).verbose}
	it "should return a string" do
		expect(verbose_time.class).to eql String
	end

	it "should be a verbose time" do
		expect(verbose_time).to eql "1 weeks 1 days 1 hours 1 minutes 1.11 seconds"
	end

	it "should show 1 seconds" do
		expect(Time.timer{sleep 1}.verbose).to eql "1.00 seconds"
	end
end

describe "Timer" do
	before :all do
		@five = Time.timer{sleep 5}
	end

	it "should return a Time object" do
		expect(@five.class).to eql Time
	end

	it "should return 5 seconds" do
		expect(@five.to_f).to be_within(0.1).of(5)
	end
end