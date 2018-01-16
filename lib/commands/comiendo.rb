require_relative '../slack_command'

class Comiendo < SlackCommand

  def do
    slack_profile emoji: ':knife_fork_plate:', text: 'comiendo'
  end
end
