	source env.bash
	# fetching the data from WOT
	curl https://www.mywot.com/en/scorecard/"$DOMAIN" -s -m 3 --retry 2 > wot_data.temp
