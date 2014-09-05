# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  SOCIAL_AUTH_REDIRECT_IS_HTTPS = true
  github_id = '2933262ee8ffe2d729d0'
  github_secret = 'd1b473069e5e978971336b6cb389aa14e337219d'
  provider :github, github_id, github_secret, scope: "repo,user"
end
