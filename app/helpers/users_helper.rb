module UsersHelper

	def create_header(days)
		dayHeaderContainer = "<div class = 'header'><div class = 'align-block'></div>"
		days.each do |day|
			dayHeaderContainer = dayHeaderContainer +  "<div class = 'header-item #{day}-header'><h3 class = 'day-titles'>#{day.upcase}</h3></div>"
		end
		dayHeaderContainer += "</div>"
		return dayHeaderContainer.html_safe
	end

	def parseHours(string)
		output = []
		split = string.upcase.split("-")
		startInt = Integer(split[0].split(":")[0])
		endInt = Integer(split[1].split(":")[0])
		# byebug

		startHour = 0
		if split[0].include?("PM")
			startHour = startInt+12
			# byebug
		else
			startHour = startInt
		end
		endHour = 0
		if split[1].include?("PM")
			endHour = endInt+12;
			# byebug
		end
		# byebug
		curHour = startHour
		count = 0
		while curHour <= endHour
			parsedStr = ''

			if (curHour > 12)
				if (count  == 0)
			        parsedStr += (curHour-12).to_s + ":00PM"
			        count = 1
			  else
		    	parsedStr += (curHour-12).to_s+ ":30PM"
          count = 0
				end
      elsif curHour == 12
				if count == 0
	        parsedStr += curHour.to_s + ":00PM"
	        count = 1
	      else
		    	parsedStr += curHour.to_s + ":30PM"
		    	count = 0
		    end
	  	else
				if (count  == 0)
    	    parsedStr += (curHour).to_s + ":00AM"
    	    count = 1
      	else
    	    parsedStr += (curHour).to_s + ":30AM"
    	    count = 0
				end
			end
			if count == 0
				curHour+=1
			end
      # curHour+=1
      output.push(parsedStr)
		end
    return output;
	end

	def capitalize(string)
		return string.charAt(0).upcase + string.slice!(0)
	end

# small rating icon for 0 0.5 1 1.5 ...
	def create_rating_icon(score)
		# print "======================"
		# print score
		if score == nil
			rating_icon = "<span>Not yet rated</span>"
			return rating_icon.html_safe
		end
		if score == 0
			rating_icon = "<span class='stars-container stars-0'>★★★★★</span>"
		elsif score == 0.5
			rating_icon = "<span class='stars-container stars-10'>★★★★★</span>"
		elsif score == 1
			rating_icon = "<span class='stars-container stars-20'>★★★★★</span>"
		elsif score == 1.5
			rating_icon = "<span class='stars-container stars-30'>★★★★★</span>"
		elsif score == 2
			rating_icon = "<span class='stars-container stars-40'>★★★★★</span>"
		elsif score == 2.5
			rating_icon = "<span class='stars-container stars-50'>★★★★★</span>"
		elsif score == 3
			rating_icon = "<span class='stars-container stars-60'>★★★★★</span>"
		elsif score == 3.5
			rating_icon = "<span class='stars-container stars-70'>★★★★★</span>"
		elsif score == 4
			rating_icon = "<span class='stars-container stars-80'>★★★★★</span>"
		elsif score == 4.5
			rating_icon = "<span class='stars-container stars-90'>★★★★★</span>"
		else
			rating_icon = "<span class='stars-container stars-100'>★★★★★</span>"

		end
		return rating_icon.html_safe
	end
# big rating icon for taprofile only

	def create_big_rating_icon(score)
		# print "======================"
		# print score
		if score == nil
			rating_icon = "<span>Not yet rated</span>"
			return rating_icon.html_safe
		end
		if score == 0
			rating_icon="""
			<button type='button' class='btn btn-default btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-default btn-grey btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-default btn-grey btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-default btn-grey btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-default btn-grey btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			"""
		elsif score == 1
			rating_icon="""
			<button type='button' class='btn btn-warning btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-default btn-grey btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-default btn-grey btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-default btn-grey btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-default btn-grey btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			"""
		elsif score == 2
			rating_icon="""
			<button type='button' class='btn btn-warning btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-warning btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-default btn-grey btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-default btn-grey btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-default btn-grey btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			"""

		elsif score == 3
			rating_icon="""
			<button type='button' class='btn btn-warning btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-warning btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-warning btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-default btn-grey btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-default btn-grey btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			"""

		elsif score == 4

			rating_icon="""
			<button type='button' class='btn btn-warning btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-warning btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-warning btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-warning btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-default btn-grey btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			"""
		else
			rating_icon="""
			<button type='button' class='btn btn-warning btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-warning btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-warning btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-warning btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			<button type='button' class='btn btn-warning btn-xs' aria-label='Left Align'>
				<span class='glyphicon glyphicon-star' aria-hidden='true'></span>
			</button>
			"""


		end
		return rating_icon.html_safe
	end
	# get the average score of review scores
	def average_rating_scores(user)
		sum=0
		index = 0
		user.ta_reviews.each do |each_review|
			sum = sum + each_review['score']
			index = index + 1
		end
	
		return sum.to_f/index
	end
	# get the array of score distribution
	def array_score_distribution(user)
		one = 0
		two = 0
		three = 0
		four = 0
		five = 0
		user.ta_reviews.each do |each_review|
			case each_review['score']
			when 1
				one = one + 1
			when 2
				two = two + 1
			when 3
				three = three + 1
			when 4
				four = four + 1
			else
				five = five + 1
			end
			return [one, two, three, four, five]
		end
	end
	# get the width of progress
	def width_of_progress(score)

		case score
		when 0
			per = '0'
		when 1
			per = '20%'
		when 2
			per = '40%'
		when 3
			per = '60%'
		when 4
			per = '80%'
		when 5
			per = '100%'
		end
		return per

	end



end
