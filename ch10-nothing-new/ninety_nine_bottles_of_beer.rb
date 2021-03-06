class BeerSong

  attr_accessor :beers

  def initialize(beers)
    	beers = 0  if beers < 0
    	beers = 99 if beers > 99
    	self.beers = beers
  end

  def print_song
    	beers.downto 1 do |i|
      		print_stanza i
    	end
  end

  	def print_stanza(n)
    	if n.zero?
      		String.new
    	else
      		puts "#{english_number n} #{bottle n} of beer on the wall,"        ,
           "#{english_number n} #{bottle n} of beer,"                    ,
           "Take one down, pass it around,"                         ,
           "#{english_number n - 1} #{bottle n-1} of beer on the wall."
    	end
	end

    def bottle(n)
    	if n == 1  
    		'bottle' 
    	else 
    		'bottles' 
    	end
    end 	


  	def english_number number
	  if number < 0 # No negative numbers.
	    	return 'Please enter a number that isn\'t negative.'
	  end
	  if number == 0
	    	return 'zero'
	  end

	  num_string = ''

	  ones_place = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']

	  tens_place = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty','seventy', 'eighty', 'ninety']
	  
	  teenagers = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']

	  zillions = [['hundred', 2],
	              ['thousand', 3],
	              ['million', 6],
	              ['billion', 9],
	              ['trillion', 12],
	              ['quadrillion', 15],
	              ['quintillion', 18],
	              ['sextillion', 21],
	              ['septillion', 24],
	              ['octillion', 27],
	              ['nonillion', 30],
	              ['decillion', 33],
	              ['undecillion', 36],
	              ['duodecillion', 39],
	              ['tredecillion', 42],
	              ['quattuordecillion', 45],
	              ['quindecillion', 48],
	              ['sexdecillion', 51],
	              ['septendecillion', 54],
	              ['octodecillion', 57],
	              ['novemdecillion', 60],
	              ['vigintillion', 63],
	              ['googol', 100]]

  		left = number

  		while zillions.length > 0
	    	zil_pair = zillions.pop
	    	zil_name = zil_pair[0]
	    	zil_base = 10 ** zil_pair[1]
	    	write = left/zil_base 
	    	left = left - write*zil_base 

    		if write > 0
	      		# Now here's the recursion:
	      		prefix = english_number write
	      		num_string = num_string + prefix + ' ' + zil_name

	      		if left > 0
	        		num_string = num_string + ' '
	      		end
	      	end
    	end
  	

	  	write = left/10 # How many tens left?
	  	left = left - write*10 # Subtract off those tens.

	  	if write > 0
	    	if ((write == 1) and (left > 0))
	      		# Since we can't write "tenty-two" instead of
	      		# "twelve", we have to make a special exception
	      		# for these.
	      		num_string = num_string + teenagers[left-1]
	      		# The "-1" is because teenagers[3] is
	      		# 'fourteen', not 'thirteen'.

	      		# Since we took care of the digit in the
	      		# ones place already, we have nothing left to write.
	      		left = 0
	    	else
	      		num_string = num_string + tens_place[write-1]
	      		# The "-1" is because tens_place[3] is
	      		# 'forty', not 'thirty'.
	    	end


    		if left > 0
      			# So we don't write 'sixtyfour'...
      			num_string = num_string + '-'
    		end
  		end

	  	write = left # How many ones left to write out?
	  	left = 0 # Subtract off those ones.

	  	if write > 0
	    	num_string = num_string + ones_place[write-1]
	    		# The "-1" is because ones_place[3] is
	    		# 'four', not 'three'.
	  	end

	  	# Now we just return "num_string"...
	  	num_string.capitalize
	end


end
