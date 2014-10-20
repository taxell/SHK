module SHK where

import System.FilePath.Posix
import Data.List(isSuffixOf)
import Prelude hiding( lex )

import LexJSH
import JSHKeywords

kompile :: FilePath -> IO ()
kompile fp = do
	src <- readFile fp
	let java = toJava src
	writeFile (toJavaFileExt fp) java

toJavaFileExt :: FilePath -> FilePath
toJavaFileExt fp = (dropExtension fp) ++ ".java"

isJSHSource :: FilePath -> Bool
isJSHSource = isSuffixOf sourceExt

--toJava :: String -> String
toJava p = let lexed = lines $ lex p
               split = map (collectAnnotations . annotateStrings) lexed
           in unlines $ concat $ map (\l -> map (\(s, b) -> if b then s else (unwords (map translate (words s) ))) l) split


-- unlines $ map (unwords . map translate . words) $ lines $ lex p

collectAnnotations :: [(Char, Bool)] -> [(String, Bool)]
collectAnnotations []              = []
collectAnnotations ((c, b) : rest) = 
    ( (c : (map fst (takeWhile (\x -> snd x == b) rest))) , b) : collectAnnotations (dropWhile (\x -> snd x == b) rest)

annotateStrings :: String -> [(Char, Bool)]
annotateStrings = as' False
    where
        as' :: Bool -> String -> [(Char, Bool)]
        as' _ []                       = []
        as' b  ('\\' : '\"' : rest)    = ('\\', b) : ('\"', b) : as' b rest
        as' True  ('\"' : rest)        = ('\"', True) : as' False rest
        as' False ('\"' : rest)        = ('\"', True) : as' True rest
        as' b (c : rest)               = (c, b) : as' b rest

sourceExt :: String
sourceExt = ".jsh" 
