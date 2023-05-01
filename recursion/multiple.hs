-- Multiple recursive calls: Fibonacci numbers

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- Bottom up approach, doesn't use for loop, but recursion to keep track of number of steps left to compute
-- At each call we incremenet the last two values (of the fib sequence) in order to know what to return
-- smaller, larger are the first two values of fib sequence (i.e. 0 and 1), steps is the number of steps left to compute. Note steps = 0 here is the same 
-- as fib(1) 
fibHelper :: Integer -> Integer -> Integer -> Integer
fibHelper smaller larger 0 = larger 
fibHelper smaller larger steps = fibHelper larger (smaller + larger) (steps - 1)

fibonacciNew :: Integer -> Integer
fibonacciNew 0 = 0
fibonacciNew n = fibHelper 0 1 (n - 1)

main = do
    print (fibonacciNew 40)