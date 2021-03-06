#!/usr/bin/env ruby

require "rubygems"

def launch

    $stdin.each do |line|

      line.chomp!
      line = line.split("\t")

      line[2].gsub!(/([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])/, '\1\2\3\4')
      line[2].gsub!(/([0-9][0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])/, '\1\2\3\4')
      line[2].gsub!(/([0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])/, '\1\2\3\4')

      line[2].gsub!(/([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])/, '\1\2\3')
      line[2].gsub!(/([0-9][0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])/, '\1\2\3')
      line[2].gsub!(/([0-9])[\. ]([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])/, '\1\2\3')

      line[2].gsub!(/([0-9][0-9][0-9])[\. ]([0-9][0-9][0-9])/, '\1\2')
      line[2].gsub!(/([0-9][0-9])[\. ]([0-9][0-9][0-9])/, '\1\2')
      line[2].gsub!(/([0-9])[\. ]([0-9][0-9][0-9])/, '\1\2')


      puts "#{line[0]}\t#{line[1]}\t#{line[2]}"
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

