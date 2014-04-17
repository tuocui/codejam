#!/usr/bin/env ruby

f_read = File.open("A-small-practice.in", "r")
f_write = File.open("A-small-practice.out", "w")

num_tests = f_read.readline.to_i
for test in 1..num_tests
  ans1 = f_read.readline.to_i - 1
  rows = []
  for i in 0..3
    rows[i] = f_read.readline.split(" ").map{|v| v.to_i}
  end
  row1 = rows[ans1]
  ans2 = f_read.readline.to_i - 1
  for i in 0..3
    rows[i] = f_read.readline.split(" ").map{|v| v.to_i}
  end
  row2 = rows[ans2]
  int_rows = row1 & row2
  if int_rows.length == 1
    f_write.write "Case ##{test}: #{int_rows[0]}\n"
  elsif int_rows.length == 0
    f_write.write "Case ##{test}: Volunteer cheated!\n"
  else
    f_write.write "Case ##{test}: Bad magician!\n"
  end
end

f_read.close unless f_read.nil?
f_write.close unless f_write.nil?