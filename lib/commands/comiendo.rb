require_relative '../slack_command'
require_relative '../system_notifier'

class Comiendo < SlackCommand

  include SystemNotifier

  attr_accessor :minutes
  def initialize(minutes)
    super()
    @minutes = minutes
  end

  def do
    slack_profile emoji: ':knife_fork_plate:', text: 'comiendo'
    sleep(minutes*60)
    slack_profile emoji: '', text: ''
    notify_so 'volviendo de comer en 3..2..1..'
  end
end
