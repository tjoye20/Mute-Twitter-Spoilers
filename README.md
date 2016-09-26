# Mute Twitter Spoilers

Rails app that helps you quickly mute multiple followers that are tweeting spoilers on your timeline.

### Project Goals
This started as a one-day Sinatra project, that I'm now converting into a Rails app. I wanted to play around a bit more with the Twitter API and implement OAuth, while practicing test-driven development in Rails.

### How the app works
You enter a keyword that you don't want to see tweets of on the search page, it returns the list of users whose recent tweets currently contain that keyword, by analyzing the first 100 tweets on your timeline. By default, the search results are hidden.

There's a button to "Show Tweets", if you want to see the contents of those user's tweets. Then, there's a "Mute Phrase" button that mutes those users, clearing your *current* timeline of tweets containing that phrase.

Note: This app doesn't currently automate the muting process yet, so you have to use this app first every time before reading new tweets on your timeline, if you don't want to see spoilers.

## Installation

* First, go to https://apps.twitter.com/ and create your Twitter App account in order to retrieve your Consumer Token and Consumer Secret.

* Second, clone the app onto your local machine, open it up and create a .env file. Enter your Consumer key and secret into this .env file as shown below:

````
CONSUMER_KEY=XXXXXXXXXXXXXXXXXX
CONSUMER_SECRET=XXXXXXXXXXXXXXXXXX
````

* Third, ```` bundle install ````. Then, ```` rails s````, to launch the app. In your browser, go to ```` localhost:3000````.

### Remaining Backlog Items

* Figure out how to automate this process.
* Turn it into a browser extension.
* Turn it into a React Native app (just to learn React Native).
