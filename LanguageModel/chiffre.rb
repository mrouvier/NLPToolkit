#!/usr/bin/env ruby

require "rubygems"

def launch

    $stdin.each do |line|

      line.chomp!
      #line = line.split("\t")

      line.gsub!(/([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])/, '\1\2\3\4')
      line.gsub!(/([0-9][0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])/, '\1\2\3\4')
      line.gsub!(/([0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])/, '\1\2\3\4')

      line.gsub!(/([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])/, '\1\2\3')
      line.gsub!(/([0-9][0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])/, '\1\2\3')
      line.gsub!(/([0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])/, '\1\2\3')

      line.gsub!(/([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])/, '\1\2')
      line.gsub!(/([0-9][0-9])[\. ]([0-9][0-9][0-9])/, '\1\2')
      line.gsub!(/([0-9])[\. ]([0-9][0-9][0-9])/, '\1\2')


      puts "#{line}"
    end

end


def errarg
    puts "Usage : ./chiffre.rb"
    puts "Mickael Rouvier <mickael.rouvier@gmail.com>"
end


if ARGV.size == 0
    launch
else
    errarg
end

