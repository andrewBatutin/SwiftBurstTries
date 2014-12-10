main = pp t1 

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Eq, Show)

leaf :: a -> Tree a
leaf x = Node x Empty Empty

t1 :: Tree Int
t1 = Node 4 (leaf 3) (Node 7 (leaf 5) (leaf 10))

pp :: Show a => Tree a -> IO ()
pp = (mapM_ putStrLn) . treeIndent
  where
    treeIndent Empty          = ["-- /-"]
    treeIndent (Node v lb rb) =
		["--" ++ (show v)] ++ map ("  |" ++ ) (treeIndent (lb)) ++ map("  '" ++ ) (treeIndent (rb)) 


