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

toJava :: String -> String
toJava p = unlines $ map (unwords . map translate . words) $ lines $ lex p

sourceExt :: String
sourceExt = ".jsh" 
