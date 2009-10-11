require 'time'

def average_time_of_day(times)

	times_in_time = times.map { |t| 
		Time.parse(t)
	}
	times_am = times_in_time.select { |t|
		t.hour < 12
	}

	avg_am = times_am.map { |t|
		t.to_f
	}.inject(0.0){|sum,el| sum + el}/times_am.size

	times_pm = times_in_time.select { |t|
		t.hour >= 12
	}
	avg_pm = times_pm.map { |t|
		t.to_f
	}.inject(0.0){|sum,el| sum + el}/times_pm.size

	if(avg_pm - avg_am  >= 12*3600) then
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
