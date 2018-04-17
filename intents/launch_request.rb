intent 'LaunchRequest' do
  return tell("Please authenticate Pizza Buddy via the Alexa App.", card: link_account_card) unless request.user_access_token_exists?

  user = User.authenticate(request.user_access_token)

  ask("Welcome to Pizza Buddy. Would you like a new pizza, or to list orders?")
end