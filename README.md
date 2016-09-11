# Mute Twitter Spoilers

Rails app that helps you quickly mute tweets on your timeline that contain spoilers/keywords that you don't want to see.

NOTE: APP IS STILL IN DEVELOPMENT.

### Project Goals
This started as a one day Sinatra project, that I'm now converting into a Rails app in order to play around with the Twitter gem and implement OAuth, while practicing test-driven development in Rails.

### How the app works
You enter a keyword that you don't want to see tweets of on the search page, it returns the list of users whose recent tweets currently contain that keyword, by analyzing the first 200 tweets on your timeline. There's a button to "Show Tweets", if you want to see the contents of those user's tweets. Then, there's a "Mute Phrase" button that mutes those users, clearing your *current* timeline of tweets containing that phrase.

## Installation

* First, go to https://apps.twitter.com/ and create your Twitter App account in order to retrieve your Consumer Token and Consumer Secret.

* Second, clone the app onto your local machine, open it up and create a .env file. Enter your Consumer key and secret into this .env file as shown below:

````
CONSUMER_KEY=XXXXXXXXXXXXXXXXXX
CONSUMER_SECRET=XXXXXXXXXXXXXXXXXX
````

* Third, ```` bundle install ````. Then, ```` rails s````, to launch the app. In your browser, go to ```` localhost:3000````.

### Remaining Backlog Items
* Update the UI.
* Turn it into a browser extension.
* Turn it into a React Native app (just to learn React Native).
