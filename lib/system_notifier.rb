require 'terminal-notifier'

module SystemNotifier
  def notify_so(message)
    TerminalNotifier.notify message
  end
end
