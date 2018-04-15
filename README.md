# Alexa Sinatra Demo Continued - Pizza Buddy

This is Part 2 of the demo for setting up an Alexa skill with Ruby! Go through the [AWS custom skills documentation](https://developer.amazon.com/docs/custom-skills/understanding-custom-skills.html) to see the full depth of Alexa's capabilities.

Based on a great guide by Maker's Academy: https://developer.amazon.com/alexa-skills-kit/makers-academy

## Setup

Note: this is a continuation of the [first part of this demo](https://github.com/domarp-j/alexa-number-facts) which goes through the basics of creating a dialogue model and setting up a Sinatra app for handling Alexa requests. If you haven't seen it already, check that out first!

### Part 1 - Using Ralyxa

1. Add Ralyxa to Gemfile
2. Update `server.rb` to require raylxa
3. Create one post controller action:
```
post '/' do
  Ralyxa::Skill.handle(request)
end
```
4. Create an `intents/` directory
5. Create a `.rb` file for each intent


