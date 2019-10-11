{- LANGUAGE OverloadedStrings -}

module Benchmark
  ( arbitraryIntVectorOf
  ) where

import Test.QuickCheck (generate, vectorOf, arbitrary) 

arbitraryIntVectorOf :: Int -> IO [Int]
arbitraryIntVectorOf n = generate (vectorOf n arbitrary)
