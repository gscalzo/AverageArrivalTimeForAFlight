require 'time'

private
class Array
	def to_sec
		map {|t|t.to_f}
	end

	def avg
		to_sec.inject(0.0){|sum,el| sum + el}/size
	end
end

class Time
	def am?
		hour < 12	
	end

	def pm?
		not am?
	end

	def to_s
		strftime("%I:%M%p").downcase
	end
	
end

DAY_IN_SEC = 24*60*60

def adjust_order_for(times)
	to_adjust?(times) ? adjusted(times) : times
end

def to_adjust?(times)
	avg_am = times.select { |t| t.am? }.avg
	avg_pm = times.select { |t| t.pm? }.avg
	avg_pm - avg_am  >= DAY_IN_SEC/2
end

def adjusted(times)
	times.map { |t|(t.am? ? t+DAY_IN_SEC : t) }
end

public
def average_time_of_day(times)
	times = adjust_order_for(times.map { |t| Time.parse(t) })

	Time.at(times.avg).to_s
end
