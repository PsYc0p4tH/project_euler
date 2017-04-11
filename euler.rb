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

#Number 9
#first draft, takes 15 seconds for 1000. I sould cut down c's time by evaluating the result of a and b instead of iterating over c
def p_triplets(max)
  test = []
  for a in 1..max do
    for b in a..max do
      for c in b..max do
        if a**2 + b**2 == c**2 && a + b + c == 1000
          puts "a:#{a} b:#{b} c:#{c} "
          return a*b*c
        end
      end
    end

  end
  return test.length
end
time = Time.now
puts p_triplets(1000)
puts Time.now - time

#Number 10
require 'enumerator'
num = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"
total = 0 
num.split("").each_cons(13) {|block| total << block.inject(1){ |product,num| product * num.to_i}}

#Number 11
#Did it by hand. could have used Matrix library (Something like Matrix.rows(array).each(:diagonal) or something along those lines.
nums = 
[[8,  2, 22, 97, 38, 15,  0, 40,  0, 75,  4,  5,  7, 78, 52, 12, 50, 77, 91,  8],
[49, 49, 99, 40, 17, 81, 18, 57, 60, 87, 17, 40, 98, 43, 69, 48,  4, 56, 62,  0],
[81, 49, 31, 73, 55, 79, 14, 29, 93, 71, 40, 67, 53, 88, 30,  3, 49, 13, 36, 65],
[52, 70, 95, 23,  4, 60, 11, 42, 69, 24, 68, 56,  1, 32, 56, 71, 37,  2, 36, 91],
[22, 31, 16, 71, 51, 67, 63, 89, 41, 92, 36, 54, 22, 40, 40, 28, 66, 33, 13, 80],
[24, 47, 32, 60, 99,  3, 45,  2, 44, 75, 33, 53, 78, 36, 84, 20, 35, 17, 12, 50],
[32, 98, 81, 28, 64, 23, 67, 10, 26, 38, 40, 67, 59, 54, 70, 66, 18, 38, 64, 70],
[67, 26, 20, 68,  2, 62, 12, 20, 95, 63, 94, 39, 63,  8, 40, 91, 66, 49, 94, 21],
[24, 55, 58,  5, 66, 73, 99, 26, 97, 17, 78, 78, 96, 83, 14, 88, 34, 89, 63, 72],
[21, 36, 23,  9, 75,  0, 76, 44, 20, 45, 35, 14,  0, 61, 33, 97, 34, 31, 33, 95],
[78, 17, 53, 28, 22, 75, 31, 67, 15, 94,  3, 80,  4, 62, 16, 14,  9, 53, 56, 92],
[16, 39,  5, 42, 96, 35, 31, 47, 55, 58, 88, 24,  0, 17, 54, 24, 36, 29, 85, 57],
[86, 56,  0, 48, 35, 71, 89,  7,  5, 44, 44, 37, 44, 60, 21, 58, 51, 54, 17, 58],
[19, 80, 81, 68,  5, 94, 47, 69, 28, 73, 92, 13, 86, 52, 17, 77,  4, 89, 55, 40],
[ 4, 52,  8, 83, 97, 35, 99, 16,  7, 97, 57, 32, 16, 26, 26, 79, 33, 27, 98, 66],
[88, 36, 68, 87, 57, 62, 20, 72,  3, 46, 33, 67, 46, 55, 12, 32, 63, 93, 53, 69],
[ 4, 42, 16, 73, 38, 25, 39, 11, 24, 94, 72, 18,  8, 46, 29, 32, 40, 62, 76, 36],
[20, 69, 36, 41, 72, 30, 23, 88, 34, 62, 99, 69, 82, 67, 59, 85, 74,  4, 36, 16],
[20, 73, 35, 29, 78, 31, 90,  1, 74, 31, 49, 71, 48, 86, 81, 16, 23, 57,  5, 54],
[ 1, 70, 54, 71, 83, 51, 54, 69, 16, 92, 33, 48, 61, 43, 52,  1, 89, 19, 67, 48]]

products = []
nums.each_with_index do |row, row_index|
  row.each_with_index do |num, num_index|
    #horizontal
    products << row[num_index .. num_index+3].inject(:*)
    #vertical
    temp = []
    for x in nums[row_index .. row_index+3] do temp << x[num_index] end
    products << temp.inject(:*)
    #diagonal forward-down
    count = 0
    temp = []
    for y in nums[row_index .. row_index+3] do
      temp << y[num_index + count] if y[num_index + count]
      count += 1
    end
    products << temp.inject(:*)
    #diagonal forward-up
    count = 0
    temp = []
    up = (row_index -3 > 0) ? (row_index -3) : 0
    for y in nums[up .. row_index ].reverse do
      temp << y[num_index + count] if y[num_index + count]
      count += 1
    end
    products << temp.inject(:*)
  end
end
p products.max

#Number 11
