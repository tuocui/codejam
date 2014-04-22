#!/usr/bin/env ruby

require "matrix"

f_read = File.open("C-large-practice.in", "r")
f_write = File.open("C-large-practice.out", "w")
#f_read = File.open("sample.in", "r")
#f_write = File.open("sample.out", "w")

num_tests = f_read.readline.to_i

def plant_bombs(r, c, r_index, c_index, m, grid)
  if r - r_index > 2 and c - c_index <= r - r_index and m >= c - c_index
    for i in c_index..c-1
      grid[r_index][i] = '*'
    end
    return plant_bombs(r, c, r_index + 1, c_index, m - (c - c_index), grid)
  end

  if c - c_index > 2 and r - r_index <= c - c_index and m >= r - r_index
    for i in r_index..r-1
      grid[i][c_index] = '*'
    end
    return plant_bombs(r, c, r_index, c_index + 1, m - (r - r_index), grid)
  end

  i = r_index
  while m > 0 and i < r - 2
    j = c_index
    while m > 0 and j < c - 2
      grid[i][j] = '*'
      m -= 1
      j += 1
    end
    i += 1
  end

  return m
end

for test in 1..num_tests
  line = f_read.readline.split(" ").map{|v| v.to_i}
  r = line[0]
  c = line[1]
  m = line[2]

  grid = Matrix.build(r, c){|r, c| "."}
  grid = grid.to_a

  if m == (r * c - 1)
    grid = grid.map{|r| r.fill("*")}
    grid[r-1][c-1] = "c"
  elsif plant_bombs(r, c, 0, 0, m, grid) > 0
    f_write.write "Case ##{test}:\nImpossible\n"
    next
  end
  grid[r-1][c-1] = "c"

  f_write.write "Case ##{test}:\n"
  f_write.write grid.map{|r| r.join("")}.join("\n")
  f_write.write "\n"
end