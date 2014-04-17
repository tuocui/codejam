#!/usr/bin/env ruby

=begin 

                .---. .---. 
               :     : o   :      COOKIES
           _..-:   o :     :-.._    /
       .-''  '  `---' `---' "   ``-.    
     .'   "   '  "  .    "  . '  "  `.  
    :   '.---.,,.,...,.,.,.,..---.  ' ;
    `. " `.                     .' " .'
     `.  '`.                   .' ' .'
      `.    `-._           _.-' "  .'  .----.
        `. "    '"--...--"'  . ' .'  .'  o   `.
        .'`-._'    " .     " _.-'`. :       o  :
      .'      ```--.....--'''    ' `:_ o       :
    .'    "     '         "     "   ; `.;";";";'
   ;         '       "       '     . ; .' ; ; ;
  ;     '         '       '   "    .'      .-'
  '  "     "   '      "           "    _.-' 
 
All credit for Cookie Monster goes to jgs.
=end

f_read = File.open("B-large-practice.in", "r")
f_write = File.open("B-large-practice.out", "w")
#f_read = File.open("sample.in", "r")
#f_write = File.open("sample.out", "w")

tests = f_read.readline.to_i

for test in 1..tests
  time = 0.0
  cps = 2.0
  line = f_read.readline.split(" ")
  c = line[0].to_f
  f = line[1].to_f
  x = line[2].to_f

  while true do
    if (c/cps) + (x / (cps + f)) < (x / cps)
      time += c/cps
      cps += f
    else
      time += x/cps
      break
    end
  end
  f_write.write "Case ##{test}: #{time}\n"
end
