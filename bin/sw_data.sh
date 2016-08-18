	source env.bash
	# fetching raw data from SIMILARWEB
	curl -s https://www.similarweb.com/website/"$DOMAIN" -s -m 3 --retry 2 | perl -0777 -MHTML::Strip -nlE 'say HTML::Strip->new->parse($_)' | tr -s ' ' | grep -v -e "^[[:blank:]]$" | tr '\n' '~' | sed 's/\%~/%,/g' | tr ',' '\n' | grep % | tr -s '~' | tr -d "[[:blank:]]" | rev | cut -d '~' -f1-2 | rev | cut -d '~' -f2 2> /dev/null > sw_data.temp