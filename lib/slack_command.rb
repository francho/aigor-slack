require 'slack-ruby-client'
require 'yaml'

class SlackCommand
  attr_reader :slack
  def initialize
    user_preferences = YAML::load_file "#{ENV['HOME']}/.aigor_slack.conf"

    Slack.configure do |config|
      config.token = user_preferences['slack_api_token']
    end

    @slack = Slack::Web::Client.new
    slack.auth_test
  end

  def slack_profile(emoji:, text:)
    status = {
      status_text: text,
      status_emoji: emoji
    }
    slack.users_profile_set profile: status.to_json
  end

  def slack_presence(presence:)
    slack.users_setPresence presence: presence
  end

  def slack_message(channel:, message:)
    slack.chat_postMessage channel: channel, text: message, as_user: true
  end
end
