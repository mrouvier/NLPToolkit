#!/usr/bin/env ruby

require "rubygems"

def launch


  $stdin.each do |line|
    line.chomp!

    line.gsub!(",", "")
    line.gsub!(";", "")
    line.gsub!("(", "")
    line.gsub!(")", "")
    line.gsub!("'", "' ")
    line.gsub!(".", "")
    line.gsub!("!", "")
    line.gsub!("?", "")
    line.gsub!("*", "")
    line.gsub!(":", "")
    line.gsub!("\"", "")
    line.gsub!("\/", "")
    line = line.split(" ").join(" ").strip

    if line != ""
      puts "#{line}"
    end
  end



end


def errarg
    puts "Usage : ./remove.rb"
    puts "Mickael Rouvier <mickael.rouvier@gmail.com>"
end


if ARGV.size == 0
    launch
else
    errarg
end

