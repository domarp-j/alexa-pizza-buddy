# Alexa Sinatra Demo Continued - Pizza Buddy

This is Part 2 of the demo for setting up an Alexa skill with Ruby! Go through the [AWS custom skills documentation](https://developer.amazon.com/docs/custom-skills/understanding-custom-skills.html) to see the full depth of Alexa's capabilities.

Based on a great guide by Maker's Academy: https://developer.amazon.com/alexa-skills-kit/makers-academy

This is a continuation of the [first part of this demo](https://github.com/domarp-j/alexa-number-facts) which goes through the basics of creating a dialogue model and setting up a Sinatra app for handling Alexa requests. If you haven't seen it already, check that out first!

A skill called "Pizza Buddy" is created as part of this demo, using (in addition to Sinatra and ngrok):
- [ralyxa](https://github.com/sjmog/ralyxa), a gem that easily handles Alexa requests & responses
- [data_mapper](https://github.com/datamapper/data_mapper) and Postgres for persistence
