#!/usr/bin/env ruby

require "rubygems"

def launch


  $stdin.each do |line|
    line.chomp!
    line = line.split("\t")

    line[2].gsub!(",", "")
    line[2].gsub!(";", "")
    line[2].gsub!("(", "")
    line[2].gsub!(")", "")
    line[2].gsub!("'", "' ")
    line[2].gsub!(".", "")
    line[2].gsub!("!", "")
    line[2].gsub!("?", "")
    line[2].gsub!("*", "")
    line[2].gsub!(":", "")
    line[2].gsub!("\"", "")
    line[2].gsub!("\/", "")
    line[2] = line[2].split(" ").join(" ").strip

    if line[2] != ""
      puts "#{line[0]}\t#{line[1]}\t#{line[2]}"
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

