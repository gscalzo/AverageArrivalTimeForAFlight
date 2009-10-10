$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'average_time_of_day'

describe 'average_time_of_day' do
	context 'for "06:00pm" and "07:00pm"' do
		it 'should be "06:30pm"' do
			avg = average_time_of_day(["06:00pm", "07:00pm"])
			avg.should == "06:30pm"
		end
	end
	context 'for "06:00pm", "07:00pm" and "08:00pm' do
		it 'should be "07:00pm"' do
			avg = average_time_of_day(["06:00pm", "07:00pm", "08:00pm"])
			avg.should == "07:00pm"
		end
	end
	context 'for "06:41am", "06:51am" and "07:01am' do
		it 'should be "06:51am"' do
			avg = average_time_of_day(["06:41am", "06:51am", "07:01am"])
			avg.should == "06:51am"
		end
	end

end
