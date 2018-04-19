# Alexa Sinatra Demo (Part 2) - Pizza Buddy

This is Part 2 of the primer for setting up an Alexa skill with Ruby! Go through the [AWS custom skills documentation](https://developer.amazon.com/docs/custom-skills/understanding-custom-skills.html) to see the full depth of Alexa's capabilities.

This is a continuation of the [Part 1](https://github.com/domarp-j/alexa-number-facts) which goes through the basics of creating a dialogue model and setting up a Sinatra app for handling Alexa requests. If you haven't seen it already, check that out first!

This guide will teach you how to build a comprehensive Alexa skill using:
- [ralyxa](https://github.com/sjmog/ralyxa), a gem that makes handling Alexa requests & responses MUCH easier
- [data_mapper](https://github.com/datamapper/data_mapper) and Postgresql for persistence

Based on a great guide by Maker's Academy: https://developer.amazon.com/alexa-skills-kit/makers-academy

## Setup

Note: These instructions are based on the developer console beta that exists as of *18 April 2018*.

### Part 1 - Using Ralyxa

1. In your `server.rb` file, make sure that you `require 'ralyxa'`
2. Create a single `post` action like so:
```
post '/' do
  Ralyxa::Skill.handle(request)
end
```
3. Create a new `intents/` directory
4. For each intent that you have defined in the AWS Alexa Developer Console, create an intent `.rb` file with the following format:
```
intent 'IntentName' do
  # See the documentation of Ralyxa for what you can do here!
end
```

### Part 2 - Using Data Mapper & Postgresql

1. Install the `data_mapper` and `dm-postgres-adapter` gems
2. Create a Postgresql database locally
3. Create a `database.rb` file in the same format as the `database.rb` file in this repo
4. Load `database.rb` in `server.rb`
5. For any classes that you would like to reflect as models, make sure to `include DataMapper::Resource` and define properties as needed (see `lib/pizza.rb` for an example).
    - Rails users: you're pretty much building the same thing as an ActiveRecord model

### Part 3 - Account Linking via the Amazon Developer Console

1. Go to the [Amazon Developer Console](https://developer.amazon.com/home.html)
2. On the top bar, select "Apps & Services"
3. Click on "Security Profiles", then "Create a New Security Profile"
4. Define a name & description for your security profile, which you will associate with your Alexa skill
5. Save your client ID and secret!
6. Go to the [Alexa Developer Console](https://developer.amazon.com/alexa/console/ask) and select the skill that you want to support account linking
7. On the left panel, select "Account Linking"
8. Flip the top switch to allow users allow users to create/link accounts with your skill
9. For the "Authorization URI" field, enter https://www.amazon.com/ap/oa
10. Ensure the "Authorization Grant Type" is "Auth Code Grant"
11. For the "Access Token URI" field, enter https://api.amazon.com/auth/o2/token
12. Enter the client ID and secret for the security profile you created
13. Add a single "Scope" called "profile"
14. Ensure that the "Client Authentication Scheme" is "HTTP Basic"
15. Save the redirect URLs listed on the page
16. Select "Save" on the top right
17. Go back to the "Security Profiles" page and edit the role you just created
18. Click on the "Web Settings" tab and edit the allowed return URLs to add one of the URLs that you got from the Account Linking page

### Part 4 - Asking the user to link their account

1. Make sure that you have a `User` model of some sort to support authentication (see `lib/user.rb` as an example)
2. For the intent that you want to require authentication, add something like the following:
```
intent 'IntentName' do
  # Ask the client to authenticate their account via the Alexa app on their phone if a user access token is not provided with the request
  # Ralyxa provides a "link_account_card" object to make this easier
  unless request.user_access_token_exists?
    return tell("Please authenticate your account via the Alexa app.", card: link_account_card)
  end

  # Use the logged-in user's user access token to authenticate the account
  user = User.authenticate(request.user_access_token)

  # Do what the command normally does
  tell("You've been authenticated! Here's what you wanted to know...")
end
```

### Part 5 - Testing Account Linking

Unfortunately, you won't be able to test account linking using the Alexa Developer Console "Test" utility. To test account linking, you will have to interact with the mobile device that is connected to your test Alexa device.

