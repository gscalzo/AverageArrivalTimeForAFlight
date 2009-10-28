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

	context 'for "23:59pm" and "12:01am' do
		it 'should be "12:00am"' do
			avg = average_time_of_day(["23:59pm", "00:01am"])
			avg.should == "12:00am"
		end
	end

	context 'for "11:59pm" and "12:01am' do
		it 'should be "12:00am"' do
			avg = average_time_of_day(["11:59pm", "00:01am"])
			avg.should == "12:00am"
		end
	end

	context 'for "11:51pm", "11:56pm", "12:01am", "12:06am" and  "12:11am"' do
		it 'should be "12:01am"' do
			avg = average_time_of_day(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"])
			avg.should == "12:01am"
		end
	end

	context 'for "11:15pm", "12:03am", "11:30pm", "11:23pm", "11:48pm"' do
		it 'should be "11:35pm"' do
			avg = average_time_of_day(["11:15pm", "12:03am", "11:30pm", "11:23pm", "11:48pm"])
			avg.should == "11:35pm"
		end
	end

	context 'for "05:15am", "06:03am", "05:30am", "05:23am", "05:48am"' do
		it 'should be "05:35am"' do
			avg = average_time_of_day(["05:15am", "06:03am", "05:30am", "05:23am", "05:48am"])
			avg.should == "05:35am"
		end
	end

	context 'for "11:15am", "12:03pm", "11:30am", "11:23am", "11:48am"' do
		it 'should be "11:35am"' do
			avg = average_time_of_day(["11:15am", "12:03pm", "11:30am", "11:23am", "11:48am"])
			avg.should == "11:35am"
		end
	end

	context 'for "6:00pm" and "6:00am' do
		it 'should be "12:00am"' do
			avg = average_time_of_day(["6:00pm", "6:00am"])
			avg.should == "12:00am"
		end
	end

	context 'for "12:01am", "11:51pm", "11:56pm",  "12:06am" and  "12:11am"' do
		it 'should be "12:01am"' do
			avg = average_time_of_day(["12:01am", "11:51pm", "11:56pm", "12:06am", "12:11am"])
			avg.should == "12:01am"
		end
	end

end
