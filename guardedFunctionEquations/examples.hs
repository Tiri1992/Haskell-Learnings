-- Writing a sign function that is 1 for values greater than 0, 0 for 0, -1 for values less than 0
-- We use guards to restrict the expressions being evaluated for certain inputs. Using the | as a guard
sign :: Int -> Int 
sign n | n > 0 = 1
       | n < 0 = -1 
       | n == 0 = 0

-- IsZero using guards
isZero :: Int -> Bool 
isZero n | n == 0 = True 
         | n /= 0 = False 

-- Checking if a string is a palindrome
isPalindrome :: String -> Bool 
isPalindrome s | reverse s == s = True 
               | otherwise      = False   

-- Exercise: Implement FizzBuzz
fizzBuzz :: Int -> String 
fizzBuzz n | (n `mod` 5) == 0 && (n `mod` 3) == 0 = "fizzbuzz"
           | (n `mod` 5) == 0 = "buzz"
           | (n `mod` 3) == 0 = "fizz"
           | otherwise  = show n





main = print (fizzBuzz 13)