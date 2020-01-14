#!/usr/bin/env ruby

require "rubygems"
require "matrix"


def similarity_score(a, b)
  if a == b
    return 3
  else
    return 0
  end
end

def launch(id, ctm, ref)

  seq_a = Array.new
  seq_a_time_begin = Array.new
  seq_a_time_end = Array.new
  f = File.open(asr)
  f.each do |line|
    line.chomp!
    line = line.split(" ")
    seq_a.push( line[4] )
    seq_a_time_begin.push( line[2].to_f )
    seq_a_time_end.push( line[2].to_f + line[3].to_f )
  end
  f.close


  ar_seq_b = Array.new
  ar_seq_b_locuteur = Array.new

  f = File.open(ref)
  f.each do |line|
    line.chomp!
    line = line.split("\t")
    if line[0] == id
      ar_seq_b.push( line[2].split(" ") ) 
      ar_seq_b_locuteur.push( line[1] )
    end
  end
  f.close

  counter = 0
  ar_seq_b.each do |seq_b|

    matrix = Matrix.build(seq_a.size+1, seq_b.size+1) { 0 }
    dir = Matrix.build(seq_a.size+1, seq_b.size+1) { 0 }

    1.upto(seq_a.size) do |i|
      1.upto(seq_b.size) do |j|
        traceback = Array.new(4, 0)
        traceback[0] = matrix[i-1, j-1]+similarity_score(seq_a[i-1], seq_b[j-1])

        traceback[1] = matrix[i-1, j] - 1
        traceback[2] = matrix[i, j-1] - 1

        traceback[3] = 0

        matrix[i,j] = traceback.max
        dir[i,j] = traceback.index( traceback.max )
      end
    end


    matrix_max = 0
    current_i = 0
    current_j = 0
    matrix.each_with_index do |x, row, col|
      if x >= matrix_max
        matrix_max = x
        current_i = row
        current_j = col
      end
    end

    trace_back = Array.new
    trace = Array.new
    trace_time_begin = Array.new
    trace_time_end = Array.new
    done = true

    while done

      max_value = -1
      dir_ = dir[current_i, current_j]
      trace_back.push( dir_ )
      trace.push( seq_a[ current_i-1 ] )
      trace_time_begin.push( seq_a_time_begin[ current_i-1 ] )
      trace_time_end.push( seq_a_time_end[ current_i-1 ] )


      if dir_ == 0
        current_i = current_i - 1
        current_j = current_j - 1
      end

      if dir_ == 1
        current_i = current_i - 1
      end

      if dir_ == 2
        current_j = current_j - 1
      end

      if matrix[current_i, current_j] == 0
        done = false
      end

    end

    puts "#{id}\t#{ar_seq_b_locuteur[counter]}\t#{trace_time_begin.reverse.first.round(2)}\t#{trace_time_end.reverse.last.round(2)}\t#{trace.reverse.join(" ")}"

    counter += 1
  end
  
end


def errarg
    puts "Usage : ./programme.rb"
    puts "Mickael Rouvier <mickael.rouvier@lif.univ-mrs.fr>"
end


if ARGV.size == 3
    launch(ARGV[0], ARGV[1], ARGV[2])
else
    errarg
end

