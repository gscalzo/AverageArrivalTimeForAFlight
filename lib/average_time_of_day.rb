require 'time'

def average_time_of_day(times)
	times_in_sec = times.map { |t|
		Time.parse(t).to_f
	}
	min = times_in_sec.min

	ranges = times_in_sec.map { |r| r-min }

	avg = ranges.inject(0.0){|sum,el| sum + el}/ranges.size
	Time.at(min+avg).strftime("%I:%M%p").downcase
end
