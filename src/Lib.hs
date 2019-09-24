module Lib
    ( insertionSort
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