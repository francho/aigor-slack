require_relative '../slack_command'

class Currando < SlackCommand
  def do
    slack_presence presence: 'auto'
    slack_profile emoji: '', text: ''
  end
end
