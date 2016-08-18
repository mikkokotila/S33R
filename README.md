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

### SCREENSHOTS

<img src="https://s4.postimg.org/6qtx7e57x/screen1.jpg" alt="Drawing" width="200"/>
