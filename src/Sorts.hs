module Sorts
  ( insertionSort
  , mergeSort
  , Order(..)
  , quickSort
  ,
  )
where

insertionSort :: Ord a => [a] -> [a]
insertionSort [] = []
insertionSort (x : xs) = isort x (insertionSort xs)
  where
    isort :: Ord a => a -> [a] -> [a]
    isort x [] = [x]
    isort x (y : ys)
      | x < y = x : y : ys
      | otherwise = y : isort x ys

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

-- about 10x slower than Data.List (sort)
merge :: Ord a => [a] -> [a] -> [a]
merge [] b = b
merge a [] = a
merge (x : xs) (y : ys)
  | x <= y = x : merge xs (y : ys)
  | otherwise = y : merge (x : xs) ys

mergeSort :: Ord a => [a] -> [a]
mergeSort = mergeAll . map (: [])

mergeAll :: Ord a => [[a]] -> [a]
mergeAll []  = []
mergeAll [x] = x
mergeAll xs  = mergeAll (mergePairs xs)

mergePairs :: Ord a => [[a]] -> [[a]]
mergePairs (x : y : ys) = merge x y : mergePairs ys
mergePairs ys           = ys

data Order = Decreasing | Increasing deriving Eq

quickSort :: Ord a => [a] -> Order -> [a]
quickSort [] _       = []
quickSort (x:xs) ord
  | ord == Decreasing = larger ++ x : smaller
  | otherwise = smaller ++ x : larger
  where
    larger  = quickSort [l | l <- xs, l > x] ord
    smaller = quickSort [s | s <- xs, s <= x] ord

