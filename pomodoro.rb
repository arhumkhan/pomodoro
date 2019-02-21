class Pomodoro
  attr_reader :work
  attr_reader :total_time
  def initialize(work=25, short_break=5, long_break=15)
  	@work = work * 60
  	@short_break = short_break * 60
  	@long_break = long_break * 60
  	@total_time = 0 #in seconds
  end

  def countdown(secs)
    time_left = Time.at(secs)
    secs.times {
      print "#{time_left.strftime("%M:%S")} left \r"
      sleep 1
      time_left -= 1
      @total_time += 1
    }
    print "\n"
  end

  def run_work_period
  	puts "Begin work for #{@work / 60} minutes."
  	countdown(@work)
  end

  def run_short_break
  	puts "Break for #{@short_break / 60} minutes."
  	countdown(@short_break)
  end

  def run_long_break
  	puts "Enjoy a long break for #{@long_break / 60} minutes."
  	countdown(@long_break)
  end

  def run_set
  	3.times {
      run_work_period
      run_short_break
    }
    run_work_period
  	run_long_break
  end
end

pomo = Pomodoro.new(1,0,0)

input = "y"
until input == "n"
  pomo.run_set
  puts "Run another set of #{pomo.work / 60} minute pomodoros? (y/n)"
  input = gets.chomp.downcase
end

puts "Total time: #{pomo.total_time / 60} minutes."
