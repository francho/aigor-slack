require_relative '../slack_command'

class Parando < SlackCommand
  def do
    slack_presence presence: 'away'
    slack_profile emoji: '', text: ''
  end
end
