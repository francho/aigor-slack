#!/usr/bin/env ruby

require 'optparse'

Dir.glob( File.join( "#{File.expand_path(File.dirname(__FILE__))}/lib/commands/*.rb" ), &method(:require) )

command = nil

OptionParser.new do |opts|
  opts.banner = "Usage: optparse1.rb [options] file1 file2 ..."

  opts.on('--cafe N', Integer, 'necesito cafeina') do |minutes|
    command = Cafe.new minutes
  end

  opts.on('--parando', 'se acabó por hoy') do
    command = Parando.new
  end

  opts.on('--currando', 'en la mina') do
    command = Currando.new
  end

  opts.on('--comiendo N', Integer, 'parando a comer') do |minutes|
    command = Comiendo.new minutes
  end

  opts.on('--pomodoro N', Integer, 'pomodoro ON') do |minutes|
    command = Pomodoro.new minutes
  end

  opts.on( '-h', '--help', 'Display this screen' ) do
    puts opts
    exit
  end
end.parse!

command.do unless command.nil?
