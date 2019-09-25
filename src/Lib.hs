module Lib
    ( insertionSort
    , linearSearch
    , BinInt(..)
    , Binary(..)
    , binaryAddition
    ) where

insertionSort :: Ord a => [a] -> [a]
insertionSort []     = []
insertionSort (x:xs) = isort x (insertionSort xs)
    where
        isort :: Ord a => a -> [a] -> [a]
        isort x []     = [x]
        isort x (y:ys)
            | x < y     = x:y:ys
            | otherwise = y:(isort x ys)

{-
insertionSort [5,2,3,1]
isort 5 (isort 2 (isort 3 (isort 1 [])))
isort 5 (isort 2 (isort 3 [1]))
isort 5 (isort 2 (1:isort 3 []))
isort 5 (isort 2 [1,3])
isort 5 (1:isort 2 [3])
isort 5 (1:[2,3])
isort 5 [1,2,3]
1:(isort 5 [2,3])
1:2:(isort 5 [3])
1:2:3:(isort 5 [])
[1,2,3,5] -}

linearSearch :: Eq a => [a] -> a -> Maybe Int
linearSearch lst val = lin lst val 0
    where
        lin :: Eq a => [a] -> a -> Int -> Maybe Int
        lin [] _ _ = Nothing
        lin (x:xs) val i
            | x == val  = Just i
            | otherwise = lin xs val (i+1)

-- binarySearch with dedicated types
data Binary = Zero | One deriving (Eq, Show)

type BinInt = [Binary]

add :: [Binary] -> Int
add [] = 0
add (x:xs)
    | x == Zero = 0 + add xs
    | otherwise = 1 + add xs

-- assuming that the lists are of equal length
binaryAddition :: BinInt -> BinInt -> BinInt
binaryAddition a b = reverse $ binadd (reverse a) (reverse b) Zero
    where
        binadd :: BinInt -> BinInt -> Binary -> BinInt
        binadd [] [] z         = [z]
        binadd (x:xs) (y:ys) z = case add [x, y, z] of
                                3 -> One : binadd xs ys One
                                2 -> Zero : binadd xs ys One
                                1 -> One : binadd xs ys Zero
                                0 -> Zero : binadd xs ys Zero