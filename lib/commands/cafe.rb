require_relative '../slack_command'

class Cafe < SlackCommand
  attr_accessor :minutes
  def initialize(minutes)
    super()
    @minutes = minutes
  end

  def do
    puts "A tomar un cafelico de #{minutes} minutes"
    slack_profile emoji: ':coffee:', text: 'cafelico'
  end
end
