require_relative '../slack_command'
require_relative '../system_notifier'

class Pomodoro < SlackCommand

  include SystemNotifier

  attr_accessor :minutes
  def initialize(minutes)
    super()
    @minutes = minutes
    notify_so "------------------ #{puts @minutes} -----------"
  end

  def do
    notify_so "Pomodoro ON (#{minutes} minutos)"
    slack_profile emoji: ':tomato:', text: 'Pomodoro'

    sleep minutes * 60
    slack_profile emoji: '', text: ''
    notify_so 'Pomodoro OFF'
  end
end
