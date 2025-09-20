def fibs(num,sequence = [0,1])
 return [] if num <= 0
 return [0] if num == 1
 return sequence if sequence.length == num

 next_val = sequence[-1] + sequence[-2]
 fibs(num,sequence << next_val)
end

puts fibs(12)