-- Evaluation order does not influence the result of expressions
-- However, this changes when non-termination comes into play

both :: Bool -> Bool -> Bool 
both False _ = False 
both True b = b 

loop :: Bool -> Bool 
loop = loop