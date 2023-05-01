both :: Bool -> Bool -> Bool 
-- lazy in its first argument, means the wildcard can be skipped from evaluation and we can consider the second arg
both _ False = False 
both b True = b 
