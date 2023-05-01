-- Instead of using pattern variables we can use literal values as patterns
isZero :: Int -> Bool 
-- If argument is 0 then True
isZero 0 = True 
-- Pattern variable n "any argument n should have isZero being False"
isZero n = False 

-- We can also use wildcard patterns for pattern variables that have no right side expressions
-- I.e. when we have pattern variable which has no argument bound to it
isZeroWild :: Int -> Bool 
isZeroWild 0 = True 
isZeroWild _ = False


-- Other literal patterns: Where we return literals for particular matching inputs
showBool :: Bool -> String 
showBool True = "Happy days!"
showBool False = "A fuck this shit!!"

main = print (showBool False)