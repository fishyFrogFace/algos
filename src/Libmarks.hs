module Libmarks
  ( sortVsMergeSort
  ) where

import           Data.List (sort)

import           Benchmark
import           Lib

sortVsMergeSort :: IO ()
sortVsMergeSort = vectorsOfIntBench "sort" "mergeSort" sort mergeSort
