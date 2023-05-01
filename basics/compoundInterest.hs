import Text.Printf (printf)

-- Haskell has no statements (like other imperative languages: Python)
-- But is defined case by case with expressions. This means no loops but recursive calls.
-- Declarative approach to programming:: Functional
-- Referential Transparency:: Pure code should have no side effects and no mutable states
-- First declare the entire expression and then define it in the body

compoundInterest :: Int -> Double 
-- Function definition
compoundInterest 0 = 1000
-- Grouping occurs with brackets ()
compoundInterest n = 1.05 * compoundInterest (n - 1)


main = printf "After 10 years, you have %.2f dollars" (compoundInterest 10)

