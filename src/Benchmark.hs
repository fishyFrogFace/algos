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

vectorsOfIntBench :: (Control.DeepSeq.NFData b1, Control.DeepSeq.NFData b2) => String -> String -> ([Int] -> b1) -> ([Int] -> b2) -> IO ()
vectorsOfIntBench n1 n2 f1 f2 =
  defaultMainWith
    (defaultConfig {reportFile = Just "benchmark.html"})
    [env (arbitraryIntVectorOf 5)
         (\ ~lst ->
            bgroup
              "5 elements"
              [bench n1 $ nf f1 lst
              ,bench n2 $ nf f2 lst])
    , env (arbitraryIntVectorOf 10)
         (\ ~lst ->
            bgroup
              "10 elements"
              [bench n1 $ nf f1 lst
              ,bench n2 $ nf f2 lst])
    , env (arbitraryIntVectorOf 100)
         (\ ~lst ->
            bgroup
              "10² elements"
              [bench n1 $ nf f1 lst
              ,bench n2 $ nf f2 lst])
    , env (arbitraryIntVectorOf 1000)
         (\ ~lst ->
            bgroup
              "10³ elements"
              [bench n1 $ nf f1 lst
              ,bench n2 $ nf f2 lst])
    , env (arbitraryIntVectorOf 10000)
         (\ ~lst ->
            bgroup
              "10⁴ elements"
              [bench n1 $ nf f1 lst
              ,bench n2 $ nf f2 lst])
    , env (arbitraryIntVectorOf 100000)
         (\ ~lst ->
            bgroup
              "10⁵ elements"
              [bench n1 $ nf f1 lst
              ,bench n2 $ nf f2 lst])
    , env (arbitraryIntVectorOf 1000000)
         (\ ~lst ->
            bgroup
              "10⁶ elements"
              [bench n1 $ nf f1 lst
              ,bench n2 $ nf f2 lst])]
