module Graph
  ( Tree()
  , dfs
  , bfs
  , showSearch
  ,
  ) where

import           Data.Sequence (Seq, drop, empty, lookup, null, (|>))
import           Prelude       hiding (drop, lookup, null)

data Tree a = Tree a (Tree a) (Tree a)| Leaf a deriving (Show, Eq, Ord)

dfs :: Tree a -> [a]
dfs (Leaf x)     = [x]
dfs (Tree x m n) = x : dfs m ++ dfs n

bfs :: Tree a -> [a]
bfs = bfs' empty

bfs' :: Seq (Tree a) -> Tree a -> [a]
bfs' seq (Leaf a)
  | not (null seq) = a : bfs' droppedSeq next
  | otherwise = [a]
  where
    droppedSeq    = drop 1 seq
    Just next = lookup 0 seq
bfs' seq (Tree a l r)
  | not (null seq) = a : bfs' newSeq next
  | otherwise = a : bfs' ((|>) droppedSeq r) l
  where
    droppedSeq      = drop 1 seq
    newSeq = (|>) ((|>) droppedSeq l) r
    Just next   = lookup 0 seq

exampleTree :: Tree Int
exampleTree = Tree 1 (Tree 2 (Tree 4 (Leaf 8) (Leaf 9)) (Tree 5 (Leaf 10) (Leaf 11))) (Tree 3 (Tree 6 (Leaf 12) (Leaf 13)) (Tree 7 (Leaf 14) (Leaf 15)))

showSearch :: IO()
showSearch = do
  putStrLn $ "DFS: " ++ show (dfs exampleTree)
  putStrLn $ "BFS: " ++ show (bfs exampleTree)
