# S33R
domain research tool specifical for counter ad fraud

### GETTING STARTED 

At the moment the only dependency is HTML::Strip. You can install it from terminal with: 

    sudo cpan install "HTML::Strip"

To make sure that all the scripts have correct permissions, in the program root folder run: 

    chmod +x ./bin/*.sh s33r.sh

Before using s33r, you also have to have a PHP server running. In the program root folder run: 

    sudo php -S 127.0.0.1:80 && ./s33r.sh fortune.com && /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --app="http://127.0.0.1/scorecard.html" --window-size="1000x800"

This should result in a browser window opening with a result for 'fortune.com'. 






#!/bin/bash

cd ~/downloads/index/test

STATUS=$(ps ax | grep "php -S 127.0.0.1:80" | grep -v grep)

if [ -z "$STATUS" ]
	then 	
		tmux new-session -d -s my_session 'sudo php -S 127.0.0.1:80'
fi

	./bin/seer.sh $DOMAIN
	./bin/cms-dashboard.sh > dash.html
	./bin/cms-report.sh > report.html

/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --app="http://127.0.0.1/dash.html" --window-size="1000x800"
