#!/usr/bin/env ruby

require "rubygems"




def is_name(line)

  if line.include?(":") == true
    name = line.split(":")[0]
    if name.size < 30
      if name.include?(".") == true
        if name =~ /[A-Z]\./
          n = name[1..-1].strip.split(". ").join(".").gsub(" ","_")
          return n
        end
      end
    end
  end

  return "Anonyme"
end


def launch(file)

  ar = Array.new

  f = File.open(file)
  f.each do |line|
    line.chomp!
    line.strip!
    if line[0] == "-" or line[0..1] == "*-"
      if ar.size != 0
        name=is_name(ar.join(" "))
        if name == "Anonyme"
          puts "#{File.basename(file, ".txt")}\t#{name}\t#{ar.join(" ")[1..-1].strip}"
        else
          puts "#{File.basename(file, ".txt")}\t#{name}\t#{ar.join(" ").split(":")[1..-1].join(":").strip}"
        end
        ar = Array.new
      end
    end
    ar.push( line )
  end
  f.close

  if ar.size != 0
    name=is_name(ar.join(" "))
    if name == "Anonyme"
      puts "#{File.basename(file, ".txt")}\t#{name}\t#{ar.join(" ")[1..-1].strip}"
    else
      puts "#{File.basename(file, ".txt")}\t#{name}\t#{ar.join(" ").split(":")[1..-1].join(":").strip}"
    end
  end



end


def errarg
    puts "Usage : ./francetv_subtitle.rb"
    puts "Mickael Rouvier <mickael.rouvier@gmail.com>"
end


if ARGV.size == 1
    launch(ARGV[0])
else
    errarg
end

