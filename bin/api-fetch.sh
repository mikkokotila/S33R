#!/bin/bash
	source env.bash
	# fetching the data in a parallel process 

production_version(){
	parallel --jobs 0 $HOMEDIR{} --args{} ::: "./bin/sw_data.sh" "./bin/alexa_data.sh" "./bin/whois_data.sh" "./bin/ga_data.sh" "./bin/wot_data.sh"
	grep table-data-order-number alexa_data.temp | grep -v topkeywordellipsis | cut -d '<' -f5,9 | cut -d '>' -f2,3 | sed "s/<span class=''>/\ /" > upstream_data.temp
}

debug_version(){
	./bin/alexa_data.sh
	echo -e "\n \n hello from ALEXA_DATA \n \n"
	./bin/ga_data.sh
	echo -e "\n \n hello from GA_DATA \n \n"
	./bin/wot_data.sh
	echo -e "\n \n hello from WOT_DATA \n \n"
	./bin/whois_data.sh
	echo -e "\n \n hello from WHOIS_DATA \n \n"
	./bin/sw_data.sh
	echo -e "\n \n hello from SW_DATA \n \n"
	grep table-data-order-number alexa_data.temp | grep -v topkeywordellipsis | cut -d '<' -f5,9 | cut -d '>' -f2,3 | sed "s/<span class=''>/\ /" > upstream_data.temp
	echo -e "\n \n hello from UPSTREAM_DATA \n \n"
}
	
	


	production_version

