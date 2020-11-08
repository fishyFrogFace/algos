module Libmarks
  ( sortVsMergeSort
  ,
  ) where

import           Data.List (sort)

import           Benchmark (vectorsOfIntBench)
import           Sorts     (mergeSort)

sortVsMergeSort :: IO ()
sortVsMergeSort = vectorsOfIntBench "sort" "mergeSort" sort mergeSort
