def fib(n)
  fib_arr = [0, 1]

  if n <= 2
    return fib_arr.take(n)
  else
    (n - 2).times do
      next_num = fib_arr[-1] + fib_arr[-2]
      fib_arr << next_num
    end
    return fib_arr
  end
end

def isPalindrome(n)
  n.to_s == n.to_s.reverse
end

def nthmax(n, a)
  n >= a.length ? nil : a.sort.reverse[n]
end

def freq(s)
  return '' if s.empty?

  frequency_hash = Hash.new(0)
  s.each_char { |char| frequency_hash[char] += 1 }
  frequency_hash.max_by { |_, frequency| frequency } [0]
end

def zipHash(arr1, arr2)
  return nil if arr1.length != arr2.length

  arr1.zip(arr2).to_h
end

def hashToArray(hash)
  hash.map { |key, value| [key, value] }
end
