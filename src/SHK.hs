module SHK where

import System.FilePath.Posix
import Data.List(isSuffixOf)
import Prelude hiding( lex )

import LexSHJ
import SHJKeywords

compileFile :: FilePath -> IO ()
compileFile fp = do
	src <- readFile fp
	let java = toJava src
	writeFile (toJavaFileExt fp) java

toJavaFileExt :: FilePath -> FilePath
toJavaFileExt fp = (dropExtension fp) ++ ".java"

isSHJSource :: FilePath -> Bool
isSHJSource = isSuffixOf ".shj"

toJava :: String -> String
toJava p = unlines $ map (unwords . map translate . words) $ lines $ LexSHJ.lex p

        
