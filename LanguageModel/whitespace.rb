#!/usr/bin/env ruby

require "rubygems"

def squeezeWhitespace(str)
  return str.gsub(/[\s\u0020\u00a0\u1680\u180e\u202f\u205f\u3000\u2000-\u200a]+/, " ")
end

def launch
  $stdin.each do |line|
    line.chomp!
    puts "#{squeezeWhitespace(line)}"
  end


end


def errarg
  puts "Usage : ./whitespace.rb"
  puts "Mickael Rouvier <mickael.rouvier@gmail.com>"
end


if ARGV.size == 0
  launch
else
  errarg
end

