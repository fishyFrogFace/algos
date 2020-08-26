module Main where

import           System.Environment (getArgs)

import           Lib
import           Utf8

main :: IO ()
main = do
  args <- getArgs
  case args of
    [x] -> readFileUtf8 x >>= writeFileUtf8 "aylmao.txt"
    _   -> print "Provide a filename"
