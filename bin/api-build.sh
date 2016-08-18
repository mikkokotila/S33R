#!/bin/bash

	AL=(alexa_data.temp);					# handler for alexa data
	SW=(sw_data.temp);						# handler for similar web data
	WH=(whois_data.temp);					# handler for whois data
	GA=(ga_data.temp);						# handler for google analytics data
	WO=(wot_data.temp);						# handler for web of trust data
	UP=(upstream_data.temp);				# handler for alexa upstream data

	# creating end points for similar web stats
	SW_DIRECT=$(sed '7!d' $SW); echo -e "SW_DIRECT=$SW_DIRECT" >> env.bash
	SW_REFERRAL=$(sed '8!d' $SW); echo -e "SW_REFERRAL=$SW_REFERRAL" >> env.bash
	SW_EMAIL=$(sed '10!d' $SW); echo -e "SW_EMAIL=$SW_EMAIL" >> env.bash
	SW_DISPLAY=$(sed '10!d' $SW); echo -e "SW_DISPLAY=$SW_DISPLAY" >> env.bash
	SW_SEARCH=$(sed '11!d' $SW); echo -e "SW_SEARCH=$SW_SEARCH" >> env.bash

	SW_ORGANICSEARCH=$(sed '15!d' $SW); echo -e "SW_ORGANICSEARCH=$SW_ORGANICSEARCH" >> env.bash
	SW_PAIDSEARCH=$(sed '16!d' $SW); echo -e "SW_PAIDSEARCH=$SW_PAIDSEARCH" >> env.bash

	SW_SOCIAL=$(sed '10!d' $SW); echo -e "SW_SOCIAL=$SW_SOCIAL" >> env.bash
	SW_SOCIAL1=$(sed '18!d' $SW); echo -e "SW_SOCIAL1=$SW_SOCIAL1" >> env.bash
	SW_SOCIAL2=$(sed '19!d' $SW); echo -e "SW_SOCIAL2=$SW_SOCIAL2" >> env.bash
	SW_SOCIAL3=$(sed '20!d' $SW); echo -e "SW_SOCIAL3=$SW_SOCIAL3" >> env.bash
	SW_SOCIAL4=$(sed '21!d' $SW); echo -e "SW_SOCIAL4=$SW_SOCIAL4" >> env.bash
	SW_SOCIAL5=$(sed '22!d' $SW); echo -e "SW_SOCIAL5=$SW_SOCIAL5" >> env.bash

	SW_COUNTRY1=$(sed '2!d' $SW); echo -e "SW_COUNTRY1=$SW_COUNTRY1" >> env.bash
	SW_COUNTRY2=$(sed '3!d' $SW); echo -e "SW_COUNTRY2=$SW_COUNTRY2" >> env.bash
	SW_COUNTRY3=$(sed '4!d' $SW); echo -e "SW_COUNTRY3=$SW_COUNTRY3" >> env.bash
	SW_COUNTRY4=$(sed '5!d' $SW); echo -e "SW_COUNTRY4=$SW_COUNTRY4" >> env.bash
	SW_COUNTRY5=$(sed '6!d' $SW); echo -e "SW_COUNTRY5=$SW_COUNTRY5" >> env.bash

	SW_BOUNCE=$(head -1 $SW); echo -e "SW_BOUNCE=$SW_BOUNCE" >> env.bash

	# creating end points for ALEXA stats
	ALEXA_TOPCOUNTRIES=$(grep -e "{title:" $AL | cut -d ':' -f3- | cut -d '"' -f1 | numsum); echo -e "ALEXA_TOPCOUNTRIES=$ALEXA_TOPCOUNTRIES" >> env.bash
	ALEXA_BOUNCERATE=$(grep -e "%  " $AL | colrm 10 | tr -d ":[[:blank:]]:" | head -1); echo -e "ALEXA_BOUNCERATE=$ALEXA_BOUNCERATE" >> env.bash
	ALEXA_SEARCHVISITS=$(grep -e "%  " $AL | colrm 10 | tr -d ":[[:blank:]]:" | tail -1); echo -e "ALEXA_SEARCHVISITS=$ALEXA_SEARCHVISITS" >> env.bash
	ALEXA_RANK=$(grep -e "  </strong>" $AL | colrm 15 | tr -d ":[[:blank:]]:" | sed 's/,//g' | head -1); echo -e "ALEXA_RANK=$ALEXA_RANK" >> env.bash
	ALEXA_PAGEVIEWS=$(grep -e "  </strong>" $AL | colrm 15 | tr -d ":[[:blank:]]:" | grep -e "[0-9]\.[0-9]" | grep -v %); echo -e "ALEXA_PAGEVIEWS=$ALEXA_PAGEVIEWS" >> env.bash
	ALEXA_TIMEONSITE=$(grep -e "  </strong>" $AL | colrm 15 | tr -d ":[[:blank:]]:" | grep -v [.,]); echo -e "ALEXA_TIMEONSITE=$ALEXA_TIMEONSITE" >> env.bash
	ALEXA_TOPKEYWORDS=$(grep -e "topkeywordellipsis" $AL | cut -d '>' -f9 | cut -d '<' -f1 | numsum); echo -e "ALEXA_TOPKEYWORDS=$ALEXA_TOPKEYWORDS" >> env.bash
	ALEXA_INLINKS=$(grep "font-4 box1-r" $AL | cut -d '>' -f2 | cut -d '<' -f1 | sed 's/,//g'); echo -e "ALEXA_INLINKS=$ALEXA_INLINKS" >> env.bash
	ALEXA_LOADSPEED=$(grep "loadspeed-panel-content" $AL | cut -d '(' -f2 | cut -d ')' -f1 | sed 's/[a-z]//g' | sed 's/\ S//' | tr ' ' '\n' | sort -u); echo -e "ALEXA_LOADSPEED=$ALEXA_LOADSPEED" >> env.bash

	ALEXA_MALES=$(grep "Males are" $AL | cut -d '>' -f3 | cut -d '<' -f1 | sed 's/-represented//'); echo -e "ALEXA_MALES=$ALEXA_MALES" >> env.bash
	ALEXA_FEMALES=$(grep "Females are" $AL | cut -d '>' -f3 | cut -d '<' -f1 | sed 's/-represented//'); echo -e "ALEXA_FEMALES=$ALEXA_FEMALES" >> env.bash

	ALEXA_UPSTREAM1N=$(cut -d ' ' -f1 $UP | sed '1!d'); echo -e "ALEXA_UPSTREAM1N=$ALEXA_UPSTREAM1N" >> env.bash
	ALEXA_UPSTREAM2N=$(cut -d ' ' -f1 $UP | sed '2!d'); echo -e "ALEXA_UPSTREAM2N=$ALEXA_UPSTREAM2N" >> env.bash
	ALEXA_UPSTREAM3N=$(cut -d ' ' -f1 $UP | sed '3!d'); echo -e "ALEXA_UPSTREAM3N=$ALEXA_UPSTREAM3N" >> env.bash
	ALEXA_UPSTREAM4N=$(cut -d ' ' -f1 $UP | sed '4!d'); echo -e "ALEXA_UPSTREAM4N=$ALEXA_UPSTREAM4N" >> env.bash
	ALEXA_UPSTREAM5N=$(cut -d ' ' -f1 $UP | sed '5!d'); echo -e "ALEXA_UPSTREAM5N=$ALEXA_UPSTREAM5N" >> env.bash

	ALEXA_UPSTREAM1=$(cut -d ' ' -f2 $UP | sed '1!d'); echo -e "ALEXA_UPSTREAM1=$ALEXA_UPSTREAM1" >> env.bash
	ALEXA_UPSTREAM2=$(cut -d ' ' -f2 $UP | sed '2!d'); echo -e "ALEXA_UPSTREAM2=$ALEXA_UPSTREAM2" >> env.bash
	ALEXA_UPSTREAM3=$(cut -d ' ' -f2 $UP | sed '3!d'); echo -e "ALEXA_UPSTREAM3=$ALEXA_UPSTREAM3" >> env.bash
	ALEXA_UPSTREAM4=$(cut -d ' ' -f2 $UP | sed '4!d'); echo -e "ALEXA_UPSTREAM4=$ALEXA_UPSTREAM4" >> env.bash
	ALEXA_UPSTREAM5=$(cut -d ' ' -f2 $UP | sed '5!d'); echo -e "ALEXA_UPSTREAM5=$ALEXA_UPSTREAM5" >> env.bash

	# creating end points for Google Analytics stats
	GA_COUNT=$(grep "</span>#" $GA | tr '#' '\n' | tr ' ' '\n' | grep ^[0-9] | tail -1); echo -e "GA_COUNT=$GA_COUNT" >> env.bash
	GA_HOSTING=$(grep "</span>#" $GA | tr '#' '\n' | tr ' ' '\n' | grep "/hoster" | cut -d '>' -f2 | cut -d '<' -f1 | sort -u | wc -l | tr -d ' ' | sed 's/^0$/na/'); echo -e "GA_HOSTING=$GA_HOSTING" >> env.bash
	GA_DOMAINS=$(grep "</span>#" $GA | tr '#' '\n' | tr ' ' '\n' | grep "/domain" | cut -d '>' -f2 | cut -d '<' -f1); echo -e "GA_DOMAINS=$GA_DOMAINS" >> env.bash

	# creating end points for Web of Trust stats
	WOT_TRUST=$(grep "trustworthiness" $WO | tr ' ' '\n' | grep data-value | cut -d '"' -f2 | tr -s ' ' | tr ' ' '\n' | sort -u); echo -e "WOT_TRUST=$WOT_TRUST" >> env.bash
	WOT_VOTES=$(grep -e "span itemprop=" $WO | grep votes | cut -d '>' -f2 | cut -d '<' -f1); echo -e "WOT_VOTES=$WOT_VOTES" >> env.bash
	WOT_CHILDSAFETY=$(grep "childsafety" $WO | tr ' ' '\n' | grep data-value | tr '"' '\n' | grep ^[0-9] | tr -s ' ' | tr ' ' '\n' | sort -u); echo -e "WOT_CHILDSAFETY=$WOT_CHILDSAFETY" >> env.bash

	# creating end points for Web of WHOIS stats
	NAME=$()
	CREATED=$(grep "Creation Date" $WH | head -1 | cut -d '-' -f3)
	WHOIS_PRIVACY=$(NAME=$(grep "Registrant Name" $WH | cut -d ' ' -f3-); PRIVATE=$(echo $NAME | grep -i -E '(protected|private|whois|guard|proxy)' | sed -E 's/[[:blank:]]//g'); if [[ -z "$PRIVATE" ]]; then echo "false"; else echo "true"; fi);  echo -e "WHOIS_PRIVACY=$WHOIS_PRIVACY" >> env.bash
	WHOIS_YEARS=$(CREATED=$(grep "Creation Date" $WH | head -1 | cut -d ' ' -f6-); WHOIS_Y=$(echo $CREATED | cut -d '-' -f3); YEAR=$(date +%Y); expr $YEAR - $WHOIS_Y 2>/dev/null); echo -e "WHOIS_YEARS=$WHOIS_YEARS" >> env.bash
	WHOIS_EMAIL=$(grep -i email $WH | tr ' ' '\n' | grep @ | sort -u | tr '\n' ',' | sed 's/,/,\ /' | sed 's/,$//'); echo -e "WHOIS_EMAIL=$WHOIS_EMAIL" >> env.bash

	# creating end points for Web of WHOIS stats
	SITES_UPSTREAM=$(echo -e "$ALEXA_UPSTREAM1N"); echo -e "SITES_UPSTREAM=$SITES_UPSTREAM" >> env.bash
	ALEXA_LOADSPEED=$(grep "loadspeed-panel-content" $AL | cut -d '(' -f2 | cut -d ')' -f1 | sed 's/[a-z]//g' | sed 's/\ S//'); echo -e "ALEXA_LOADSPEED=$ALEXA_LOADSPEED" >> env.bash