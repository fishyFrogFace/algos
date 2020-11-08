module Lib
  ( insertionSort
  , linearSearch
  , BinInt (..)
  , Binary (..)
  , binaryAddition
  , mergeSort
  , binarySearch
  , sumOfTwo
  , quickSort
  ,
  )
where

import           Data.Array (Array, listArray, (!))
import           Data.List  (sort)
import           Data.Maybe (isNothing)
import           Utils      (Cond ((:?)), (?))

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

linearSearch :: Eq a => [a] -> a -> Maybe Int
linearSearch lst val = lin lst val 0
  where
    lin :: Eq a => [a] -> a -> Int -> Maybe Int
    lin [] _ _ = Nothing
    lin (x : xs) val i
      | x == val = Just i
      | otherwise = lin xs val (i + 1)

-- binarySearch with dedicated types
data Binary
  = Zero
  | One
  deriving (Eq, Show)

type BinInt = [Binary]

toInt :: Binary -> Int
toInt One  = 1
toInt Zero = 0

add :: [Binary] -> Int
add lst = sum $ map toInt lst

-- assuming that the lists are of equal length
binaryAddition :: BinInt -> BinInt -> BinInt
binaryAddition a b = reverse $ binadd (reverse a) (reverse b) Zero
  where
    binadd :: BinInt -> BinInt -> Binary -> BinInt
    binadd [] [] z = [z]
    binadd (x : xs) (y : ys) z = result : binadd xs ys carry
      where
        added = add [x, y, z]
        carry = added >= 2 ? One :? Zero
        result = added `mod` 2 == 0 ? Zero :? One

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

arr :: Array Int Int
arr = listArray (0, 500) [0 .. 500] :: Array Int Int

-- implement binary search to have search in log n time complexity
binarySearch :: Ord e => Array Int e -> Int -> Int -> e -> Maybe Int
binarySearch a start end e
  | mElem == e = Just middle
  | start == end = Nothing
  | mElem < e = binarySearch a (middle + 1) end e
  | otherwise = binarySearch a start (middle - 1) e
  where
    middle = (start + end) `div` 2
    mElem = a ! middle

-- TODO benchmark against old implementation
-- i don't know where to find old implementation
sumOfTwo :: [Int] -> Int -> Bool
sumOfTwo [] _ = False
sumOfTwo lst n = sumOfTwo' 0
  where
    sorted = sort lst -- O(n log n), using sort because of performance
    l = length sorted - 1 -- O(n)
    arr = listArray (0, l) sorted -- assuming O(n), might be wrong
    sumOfTwo' :: Int -> Bool
    sumOfTwo' i
      | i > l = False
      | isNothing search = sumOfTwo' $ i + 1
      | otherwise = True
      where
        search = binarySearch arr 0 l find
        find = n - (arr ! i)

quickSort :: Ord a => [a] -> [a]
quickSort []     = []
quickSort (x:xs) = smaller ++ x : larger
  where
    larger  = quickSort [l | l <- xs, l > x]
    smaller = quickSort [s | s <- xs, s <= x]
