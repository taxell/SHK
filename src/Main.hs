module Main where

import System.Environment(getArgs)
import System.Exit(exitWith)
import System.Process(rawSystem)

import SHK

main :: IO ()
main = do
	args <- getArgs
	let srcFiles = filter isJSHSource args
	mapM_ kompile srcFiles
	let jArgs = map (\a -> if isJSHSource a then toJavaFileExt a else a) args
	exitCode <- rawSystem "javac" jArgs
	exitWith exitCode
