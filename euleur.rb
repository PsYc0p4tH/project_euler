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


#Number 4
def isPalidrome(num)
  return true if num.to_s.reverse == num.to_s
  false
end

palindromes = []
for i in (100 * 100) ... (999 * 999)
  palindromes << i if isPalidrome(i)
end

puts palindromes.count

def factors_with_threes(num)
  factors=[]
  with_threes = []
  for i in 1 .. num
    if num % i == 0
      if factors.include? [num / i, i]
        break
      end
      with_threes << num if i.to_s.length == 3 && (num/i).to_s.length == 3
      factors << [i, num / i]
    end
  end
  return with_threes
end
threes = []
for i in palindromes do
  #puts "=======\\ #{i} /======="
  threes << factors_with_threes(i)
end
puts threes.max

#Number 5
smallest_multiple = 20
while (2 ... 20).all? {|num| smallest_multiple % num == 0} == false
  smallest_multiple += 1
end
puts smallest_multiple

#Number 6

puts (((1 .. 100).inject {|sum, n| sum + n})**2) - (1 .. 100).inject {|sum, n| sum + n**2}

#Number 7 
require 'prime'
puts Prime.first(10001).max
#or
# Takes about 1.2 seconds for the first 10001 numbers, because the list of number keeps growing
#and about 55.5 for 100001 first numbers
def sieve(nth_prime)
  primes = [2]
  num = 2
  while primes.length <= nth_prime do
    primes << num if !primes.any? {|prime| num % prime == 0}
    num +=1
  end
  return primes[primes.length-2] # -2 because we don't put 1 (because every number is divisble by 1) and index is from 0 to x thus -2
end

sieve(10001)

#Number 8 
require 'enumerator'
num = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"
total = []
num.split("").each_cons(13) {|block| total << block.inject(1){ |product,num| product * num.to_i} }
p total.reject{|x| x == 0}.max
