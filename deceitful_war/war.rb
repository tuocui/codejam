#!/usr/bin/env ruby

f_read = File.open("D-large-practice.in", "r")
f_write = File.open("D-large-practice.out", "w")
#f_read = File.open("sample.in", "r")
#f_write = File.open("sample.out", "w")

num_tests = f_read.readline.to_i
for test in 1..num_tests
  num_blocks = f_read.readline.to_i
  naomi_blocks = f_read.readline.split(" ").map{|v| v.to_f}
  ken_blocks = f_read.readline.split(" ").map{|v| v.to_f}

  naomi_blocks.sort!
  ken_blocks.sort!
  n_blocks_copy = naomi_blocks.clone
  k_blocks_copy = ken_blocks.clone

  # Deceitful
  d_points = 0
  for i in 0..num_blocks-1
    if n_blocks_copy[0] < k_blocks_copy[0]
      n_blocks_copy.delete_at(0)
      k_blocks_copy.delete_at(k_blocks_copy.length - 1)
    elsif n_blocks_copy[0] > k_blocks_copy[0]
      n_blocks_copy.delete_at(0)
      k_blocks_copy.delete_at(0)
      d_points += 1
    end
  end

  # Nice
  n_points = 0
  for i in 0..num_blocks-1
    chosen_n = naomi_blocks.last
    k_index = ken_blocks.find_index{ |x| x > chosen_n }
    if k_index
      ken_blocks.delete_at(k_index)
    else
      n_points += 1
      ken_blocks.delete_at(0)
    end
    naomi_blocks.delete_at(naomi_blocks.length - 1)
  end

  f_write.write "Case ##{test}: #{d_points} #{n_points}\n"
end
