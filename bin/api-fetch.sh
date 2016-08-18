#!/bin/bash

	# fetching the data in a parallel process 
	parallel $HOMEDIR{} --args{} ::: "./bin/sw_data.sh" "./bin/alexa_data.sh" "./bin/whois_data.sh" "./bin/ga_data.sh" "./bin/wot_data.sh"

	# creating a second temp file for alexa for UPSTREAM...
	grep table-data-order-number alexa_data.temp | grep -v topkeywordellipsis | cut -d '<' -f5,9 | cut -d '>' -f2,3 | sed "s/<span class=''>/\ /" > upstream_data.temp