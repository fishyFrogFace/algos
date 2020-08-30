module Lec1
  ( insertionSort2
  , sumOfList
  , fillSquareWithL
  ,
  )
where

insertionSort2 :: Ord a => [a] -> [a]
insertionSort2 = isort2 []
  where
    isort2 :: Ord a => [a] -> [a] -> [a]
    isort2 sorted []       = sorted
    isort2 sorted (x : xs) = isort2 (isort2' sorted x) xs
    isort2' :: Ord a => [a] -> a -> [a]
    isort2' [] n = [n]
    isort2' l@(x : xs) n
      | x <= n = x : isort2' xs n
      | otherwise = n : l

sumOfList :: Num a => [a] -> a
sumOfList []       = 0
--sumOfList (x : xs) = x + sumOfList xs
sumOfList (x : xs) = foldr (+) x xs

fillSquareWithL = undefined
