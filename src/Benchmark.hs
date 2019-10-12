{- LANGUAGE OverloadedStrings -}

module Benchmark
  ( arbitraryIntVectorOf
  , vectorsOfIntBench
  ) where

import Test.QuickCheck (generate, vectorOf, arbitrary) 
import Criterion.Types (reportFile)
import Criterion (bench, nf, bgroup, env)
import Criterion.Main (defaultMainWith, defaultConfig) 
import Control.DeepSeq (NFData(..))

arbitraryIntVectorOf :: Int -> IO [Int]
arbitraryIntVectorOf n = generate (vectorOf n arbitrary)

vectorsOfIntBench :: (Control.DeepSeq.NFData b1, Control.DeepSeq.NFData b2) => ([Int] -> b1) -> ([Int] -> b2) -> IO ()
vectorsOfIntBench f1 f2 =
  defaultMainWith
    (defaultConfig {reportFile = Just "benchmark.html"})
    [env (arbitraryIntVectorOf 100)
         (\ ~lst ->
            bgroup
              "f1 vs f2/100"
              [bench "f1" $ nf f1 lst
              ,bench "f2" $ nf f2 lst])
    , env (arbitraryIntVectorOf 1000)
         (\ ~lst ->
            bgroup
              "f1 vs f2/1000"
              [bench "f1" $ nf f1 lst
              ,bench "f2" $ nf f2 lst])
    , env (arbitraryIntVectorOf 10000)
         (\ ~lst ->
            bgroup
              "f1 versus f2/10000"
              [bench "f1" $ nf f1 lst
              ,bench "f2" $ nf f2 lst])
    , env (arbitraryIntVectorOf 100000)
         (\ ~lst ->
            bgroup
              "f1 versus f2/100000"
              [bench "f1" $ nf f1 lst
              ,bench "f2" $ nf f2 lst])
    , env (arbitraryIntVectorOf 1000000)
         (\ ~lst ->
            bgroup
              "f1 versus f2/1000000"
              [bench "f1" $ nf f1 lst
              ,bench "f2" $ nf f2 lst])]
