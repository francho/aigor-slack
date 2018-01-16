require_relative '../slack_command'

class Cafe < SlackCommand
  attr_accessor :minutes
  def initialize(minutes)
    super()
    @minutes = minutes
  end

  def do
    slack_profile emoji: ':coffee:', text: 'cafelico'
    sleep(minutes*60)
    slack_profile emoji: '', text: ''
  end
end
