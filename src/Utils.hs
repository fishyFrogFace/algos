module Utils
  ( (<$$>)
  , split
  , strip
  ) where

wsch :: String
wsch = " \t\r\n"

(<$$>) :: (Functor f1, Functor f2) => (a -> b) -> f1 (f2 a) -> f1 (f2 b)
a <$$> b = (fmap . fmap) a b

--from GHC.Util
split :: Char -> String -> [String]
split c s = case rest of
                []     -> [chunk]
                _:rest -> chunk : split c rest
  where (chunk, rest) = break (==c) s

strip :: String -> String
strip = unwords . words
