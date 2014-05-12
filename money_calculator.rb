class MoneyCalculator
	attr_accessor :total, :hash, :lol
  def initialize(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands)
	@ones = ones.to_i*1 
	@fives = fives.to_i*5
	@tens = tens.to_i*10
	@twenties = twenties.to_i*20
	@fifties = fifties.to_i*50
	@hundreds = hundreds.to_i*100
	@five_hundreds = five_hundreds.to_i*500
	@thousands = thousands.to_i*1000
	@total = @ones + @fives + @tens + @twenties + @fifties + @hundreds + @five_hundreds + @thousands
	@hash = {'ones'=> 0, 'fives'=>0, 'tens'=>0, 'twenties'=>0, 'fifties'=>0, 'hundreds'=>0, 'five hundreds'=>0, 'thousands'=>0}
    # each parameter represents the quantity per denomination of money
    # these parameters can be assigned to instance variables and used for computation

    # add a method called 'change' that takes in a parameter of how much an item costs
    # and returns a hash of how much change is to be given
    # the hash will use the denominations as keys and the amount per denomination as values
    # i.e. {:fives => 1, fifties => 1, :hundreds => 3}
  end
  
  def change(wew)
	@due = @total.to_i - wew.to_i
	@lol = @due
	while @due > 0 do
		if @due == 0
			break
		elsif @due >= 1000
			@due = @due.to_i - 1000
			@hash['thousands'] += 1
	
		elsif @due >= 500
			@due = @due.to_i - 500
			@hash['five hundreds'] += 1
	
		elsif @due >= 100
			@due = @due.to_i - 100
			@hash['hundreds'] +=1
	
		elsif @due >= 50
			@due = @due.to_i - 50
			@hash['fifties'] += 1
	
		elsif @due >= 20
			@due = @due.to_i - 20
			@hash['twenties'] += 1
	
		elsif @due >= 10
			@due = @due.to_i - 10
			@hash['tens'] += 1
	
		elsif @due >= 5
			@due = @due.to_i - 5
			@hash['fives'] += 1
	
		elsif @due >= 1
			@due = @due.to_i - 1
			@hash['ones'] += 1
		end
	end
  end
end