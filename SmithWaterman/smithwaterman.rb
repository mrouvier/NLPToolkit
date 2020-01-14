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

def launch

  seq_a = "salit les amis comment ca vous allez".split(" ")
  seq_b = "amis comment vous allez".split(" ")

  puts "Sentence A : #{seq_a.join(" ")}"
  puts "Sentence B : #{seq_b.join(" ")}"

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

  done = true


  while done

    max_value = -1
    dir_ = dir[current_i, current_j]
    trace_back.push( dir_ )
    trace.push( seq_a[ current_i-1 ] )

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

  puts "\n\n\nAlignement :"
  puts "#{trace.reverse.join(" ")}"
  
end


def errarg
    puts "Usage : ./smithwiterman.rb"
    puts "Mickael Rouvier <mickael.rouvier@gmail.com>"
end


if ARGV.size == 0
    launch
else
    errarg
end

