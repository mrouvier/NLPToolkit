#!/usr/bin/env ruby

require "rubygems"

def accent(str)

    temp_word = str

    temp_word = temp_word.gsub("À", "à")
    temp_word = temp_word.gsub("Â", "â")

    temp_word = temp_word.gsub("Ç", "ç")

    temp_word = temp_word.gsub("È", "è")
    temp_word = temp_word.gsub("É", "é")
    temp_word = temp_word.gsub("Ê", "ê")
    temp_word = temp_word.gsub("Ë", "ë")

    temp_word = temp_word.gsub("Î", "î")
    temp_word = temp_word.gsub("Ï", "ï")

    temp_word = temp_word.gsub("Ô", "ô")
    temp_word = temp_word.gsub("Ö", "ö")


    temp_word = temp_word.gsub("Œ", "oe")
    temp_word = temp_word.gsub("œ", "oe")


    temp_word = temp_word.gsub("Ù", "ù")
    temp_word = temp_word.gsub("Û", "û")
    temp_word = temp_word.gsub("Ü", "ü")

    temp_word = temp_word.gsub("Ÿ", "ÿ")
    temp_word = temp_word.gsub("Ÿ", "ÿ")

    return temp_word
end


def launch

    $stdin.each do |line|
        line.chomp!
        line = line.split("\t")
        line[2].downcase!
        line[2] = accent(line[2])
        puts "#{line[0]}\t#{line[1]}\t#{line[2]}"
    end


end


def errarg
    puts "Usage : ./minuscule.rb"
    puts "Mickael Rouvier <mickael.rouvier@gmail.com>"
end


if ARGV.size == 0
    launch
else
    errarg
end

