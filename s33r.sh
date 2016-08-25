#!/bin/bash
	echo -e "DOMAIN=$1" >> env.bash						# pick the domain input from positional parameters and store in environment
	source env.bash

	export HOMEDIR=(/Users/Mikko/documents/dev/bin/)	# set homedir for the sub-shells 
	#export DB=new.db 									# set location of the DB 

	# api 
	./bin/api-fetch.sh 									# fetching data from sources
	./bin/env-cleanup.sh 								# cleans up the environment file
	./bin/api-build.sh		 							# build the API output
	./bin/env-cleanup.sh 								# cleans up the environment file
	#./bin/env-cleanup.sh 								# cleans up the environment file
	
	# scores
	./bin/score-compute.sh 								# compute the scores for the dashboard
	
	# fronted build
	./bin/cms-scorecard.sh > scorecard.html				# build the scorecard view on the dashboard
	./bin/cms-inputs.sh > inputs.html					# build the inputs report view on the dashboard

	# tidy up
	./bin/export-csv.sh									# export to csv format
	./bin/finish-cleanup.sh								# remove all the temp files