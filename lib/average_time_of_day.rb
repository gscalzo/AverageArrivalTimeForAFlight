require 'time'

def average_time_of_day(times)

	times_in_time = times.map { |t| 
		Time.parse(t)
	}
	if(times_in_time.first.hour >= 12) then

		times_in_time = times_in_time.map { |t|
			(t.hour < 12 ? t+60*60*24 : t)
		}
	end

	times_in_sec = times_in_time.map { |t|
		t.to_f
	}
	min = times_in_sec.min

	ranges = times_in_sec.map { |r| r-min }

	avg = ranges.inject(0.0){|sum,el| sum + el}/ranges.size
	Time.at(min+avg).strftime("%I:%M%p").downcase
end
