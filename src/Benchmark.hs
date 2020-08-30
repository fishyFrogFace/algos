module Benchmark
  ( vectorsOfIntBench,
  )
where

import Control.DeepSeq (NFData (..))
import Criterion (bench, bgroup, env, nf)
import Criterion.Main (defaultConfig, defaultMainWith)
import Criterion.Types (reportFile)
import Test.QuickCheck (arbitrary, generate, vectorOf)

arbitraryIntVectorOf :: Int -> IO [Int]
arbitraryIntVectorOf n = generate (vectorOf n arbitrary)

vectorsOfIntBench ::
  (Control.DeepSeq.NFData b1, Control.DeepSeq.NFData b2) =>
  String ->
  String ->
  ([Int] -> b1) ->
  ([Int] -> b2) ->
  IO ()
vectorsOfIntBench n1 n2 f1 f2 =
  defaultMainWith
    (defaultConfig {reportFile = Just $ n1 ++ "-" ++ n2 ++ ".html"})
    [ env
        (arbitraryIntVectorOf 5)
        ( \ ~lst ->
            bgroup "5 elements" [bench n1 $ nf f1 lst, bench n2 $ nf f2 lst]
        ),
      env
        (arbitraryIntVectorOf 10)
        ( \ ~lst ->
            bgroup "10 elements" [bench n1 $ nf f1 lst, bench n2 $ nf f2 lst]
        ),
      env
        (arbitraryIntVectorOf 100)
        ( \ ~lst ->
            bgroup "10² elements" [bench n1 $ nf f1 lst, bench n2 $ nf f2 lst]
        ),
      env
        (arbitraryIntVectorOf 1000)
        ( \ ~lst ->
            bgroup "10³ elements" [bench n1 $ nf f1 lst, bench n2 $ nf f2 lst]
        )
    ]
