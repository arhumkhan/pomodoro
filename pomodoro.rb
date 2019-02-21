class Pomodoro
  attr_reader :work
  def initialize(work=25, short_break=5, long_break=15)
  	@work = work
  	@short_break = short_break
  	@long_break = long_break
  end

  def run_work_period
    puts "Begin work for #{@work} seconds."
    @work.times {
  	  sleep 1
  	}
  end
end

pomo = Pomodoro.new
pomo.run_work_period
