module Utf8
  ( writeFileUtf8
  , readFileUtf8
  ) where

import           Control.DeepSeq (($!!))
import           System.IO       (IOMode (..), hGetContents, hPutStr,
                                  hSetEncoding, utf8, withFile)

writeWithMode :: FilePath -> String -> IOMode -> IO ()
writeWithMode fp content mode =
  withFile fp mode $ \h -> do
    hSetEncoding h utf8
    hPutStr h content

writeFileUtf8 :: FilePath -> String -> IO ()
writeFileUtf8 fp content = writeWithMode fp content WriteMode

appendFileUtf8 :: FilePath -> String -> IO ()
appendFileUtf8 fp content = writeWithMode fp content AppendMode

readFileUtf8 :: FilePath -> IO String
readFileUtf8 fp =
  withFile fp ReadMode $ \h -> do
    hSetEncoding h utf8
    f <- hGetContents h
    return $!! f
