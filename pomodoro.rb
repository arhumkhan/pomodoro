class Pomodoro
  attr_reader :work
  attr_reader :total_work
  def initialize(work=25, short_break=5, long_break=15)
    @work = work * 60
    @short_break = short_break * 60
    @long_break = long_break * 60
    @total_work = 0 #in seconds
  end

  def countdown(secs, working = false)
    time_left = Time.at(secs)
    secs.times {
      print "#{time_left.strftime("%M:%S")} left \r"
      sleep 1
      time_left -= 1
      @total_work += 1 if working
    }
    print "\n"
  end

  def run_work_period
    puts "Begin work for #{@work / 60} minutes."
    countdown(@work, true)
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

puts "Use default 25-5-15 pomodoro scheme or create a custom scheme?"
puts "-- default"
puts "-- create"

choice = gets.chomp.downcase
case choice
when 'default'
  pomo = Pomodoro.new
when 'create'
  puts "Enter work period duration, short break duration, and the long break duration:"
  puts "(In minutes and separated by spaces please!)"
  input = gets.chomp.downcase
  durations = input.split(' ')
  #gotta put a bunch of checks here eventually
  pomo = Pomodoro.new(durations[0].to_i, durations[1].to_i, durations[2].to_i)
end

input = "y"
until input == "n"
  pomo.run_set
  puts "Run another set of #{pomo.work / 60} minute pomodoros? (y/n)"
  input = gets.chomp.downcase
end
puts "Total time: #{pomo.total_work / 60} minutes."

