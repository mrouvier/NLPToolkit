#!/usr/bin/env ruby

require "rubygems"



def number_to_human(number)

    if number == 0
        return "zéro"
    end


    million = number / 1000000
    mille = (number - (million * 1000000) )/1000
    cent = number - (million * 1000000 + mille * 1000)

    human = Array.new

    if million != 0
        if million == 1
            human.push("un million")
        else
            human.push( range_1_to_999(million) )
            human.push("millions")
        end
    end

    if mille != 0
        if mille == 1
            human.push("mille")
        else
            human.push( range_1_to_999(mille) )
            human.push("mille")
        end
    end

    if cent != 0
        human.push( range_1_to_999(cent) )
    end

    return human.join(" ")

end


def range_1_to_999(number)
    unite = ["", "un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf", "dix", "onze", "douze", "treize", "quatorze", "quinze", "seize", "dix-sept", "dix-huit", "dix-neuf"]
    dixaines = ["", "", "vingt", "trente", "quarante", "cinquante", "soixante", "soixante", "quatre-vingt", "quatre-vingt"]

    units = number % 10
    tens = (number % 100 - units) / 10
    hundreds = (number % 1000 - number % 100) / 100

    human = Array.new

    if hundreds > 0
        if hundreds == 1
            human.push("cent")
        else
            human.push(unite[hundreds])
            human.push("cent")
        end
    end

    if tens == 0
        human.push(unite[units]) if units > 0
    elsif tens == 1 and units <= 10
        human.push(unite[10+units])
    elsif tens == 7 or tens == 9
        human.push(dixaines[tens])
        human.push("et") if tens == 7 and units == 1
        human.push(unite[10+units]) if units > 0
    else
        human.push(dixaines[tens])
        human.push("et") if units == 1 and tens != 8
        human.push(unite[units]) if units > 0
    end

    return human.join(" ")
end



def launch


    $stdin.each do |line|
        ar = Array.new
        line.chomp!
        line = line.split(" ")
        line.each do |x|
            if x.match(/^[0-9]+$/)
                temp = number_to_human(x.to_i)
                if temp[-6..-1] == " cent"
                    temp += "s"
                end
                ar.push( temp )
            else
                ar.push( x )
            end
        end
        puts "#{ar.join(" ")}"
    end



end


def errarg
    puts "Usage : ./date.rb"
    puts "Mickael Rouvier <mickael.rouvier@gmail.com>"
end


if ARGV.size == 0
    launch
else
    errarg
end

