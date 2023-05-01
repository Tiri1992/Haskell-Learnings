-- How partial applications work
both :: Bool -> Bool -> Bool 
both True True = True 
both _ _ = False

mystery :: Bool -> Bool
mystery b = both True b 

main = do 
    print (mystery True)
    print (mystery False)