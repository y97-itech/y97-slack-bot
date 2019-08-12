Rails.application.config.middleware.use OmniAuth::Builder do
  scopes = %w[
    bot
    channels:read
    chat:write:bot
    groups:read
    users:read
    team:read
  ]
  provider :slack, ENV['SLACK_CLIENT_ID'], ENV['SLACK_CLIENT_SECRET'], scope: scopes.join(',')
end
