#Number 2
arr = [1,2]
while true
  break if arr[-2] + arr[-1] > 4000000 
  arr << arr[-2] + arr[-1]
end
puts arr.select(&:even?).inject(:+)

#Number 3

require 'prime'
600851475143.prime_division

#or

def factors(num)
  factors=[]
  for i in 1 .. num
    if num % i == 0
      if factors.include? num / i
        break
      end
      factors << i
    end
  end
  return factors
end


def isPrime?(num)
  for i in 2 ... num do
    return false if num % i == 0
  end
  true
end

test = []
for i in factors(600851475143)
  test << i if isPrime?(i)
end
puts test.max


