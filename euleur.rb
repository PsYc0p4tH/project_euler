#Number 2
arr = [1,2]
while true
  break if arr[-2] + arr[-1] > 4000000 
  arr << arr[-2] + arr[-1]
end
puts arr.select(&:even?).inject(:+)

#Number 3
