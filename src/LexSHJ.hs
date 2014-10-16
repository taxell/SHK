module LexSHJ(lex) where

import Prelude hiding( lex )

lex :: String -> String
lex s = lexOp True $ lexSep True s

lexSep :: Bool -> String -> String
lexSep _ []                       = []
lexSep True  ('\"' : rest)        = '\"' : lexSep False rest
lexSep False ('\\' : '\"' : rest) = '\\' : '\"' : lexSep False rest
lexSep False ('\"' : rest)        = '\"' : lexSep True rest
lexSep False (c : rest)           = c : lexSep False rest
lexSep _ (c : rest)               = if isSepChar c then ' ' : c : ' ' : lexSep True rest
                                                   else c : lexSep True rest
isSepChar :: Char -> Bool
isSepChar c = c `elem` "{}[]()<>.,;:"

lexOp :: Bool -> String -> String
lexOp _ [] = []

lexOp True  ('\"' : rest)        = '\"' : (lexOp False rest)
lexOp False ('\\' : '\"' : rest) = '\\' : '\"' : lexOp False rest
lexOp False ('\"' : rest)        = '\"' : lexOp True rest
lexOp False (c : rest)           = c : lexOp False rest

lexOp _ ('>' : '>' : '>' : '=' : rest) = '>' : '>' : '>' : '=' : ' ' : lexOp True rest
lexOp _ ('>' : '>' : '>' : rest)       = '>' : '>' : '>' : ' ' : lexOp True rest
lexOp _ ('>' : '>' : '=' : rest)       = '>' : '>' : '=' : ' ' : lexOp True rest
lexOp _ ('<' : '<' : '=' : rest)       = '<' : '<' : '=' : ' ' : lexOp True rest
lexOp _ ('+' : '+' : rest) = ' ' : '+' : '+' : ' ' : lexOp True rest
lexOp _ ('-' : '-' : rest) = ' ' : '-' : '-' : ' ' : lexOp True rest
lexOp _ ('&' : '&' : rest) = '&' : '&' : ' ' : lexOp True rest
lexOp _ ('=' : '=' : rest) = '=' : '=' : ' ' : lexOp True rest
lexOp _ ('!' : '=' : rest) = '!' : '=' : ' ' : lexOp True rest
lexOp _ ('<' : '=' : rest) = '<' : '=' : ' ' : lexOp True rest
lexOp _ ('>' : '=' : rest) = '>' : '=' : ' ' : lexOp True rest
lexOp _ ('+' : '=' : rest) = '+' : '=' : ' ' : lexOp True rest
lexOp _ ('-' : '=' : rest) = '-' : '=' : ' ' : lexOp True rest
lexOp _ ('*' : '=' : rest) = '*' : '=' : ' ' : lexOp True rest
lexOp _ ('/' : '=' : rest) = '/' : '=' : ' ' : lexOp True rest
lexOp _ ('%' : '=' : rest) = '%' : '=' : ' ' : lexOp True rest
lexOp _ ('&' : '=' : rest) = '&' : '=' : ' ' : lexOp True rest
lexOp _ ('|' : '=' : rest) = '|' : '=' : ' ' : lexOp True rest
lexOp _ ('^' : '=' : rest) = '^' : '=' : ' ' : lexOp True rest
lexOp _ ('+' : rest) = '+' : ' ' : lexOp True rest
lexOp _ ('-' : rest) = '-' : ' ' : lexOp True rest
lexOp _ ('*' : rest) = '*' : ' ' : lexOp True rest
lexOp _ ('/' : rest) = '/' : ' ' : lexOp True rest
lexOp _ ('%' : rest) = '%' : ' ' : lexOp True rest
lexOp _ ('!' : rest) = '!' : ' ' : lexOp True rest
lexOp _ ('~' : rest) = '~' : ' ' : lexOp True rest
lexOp _ ('&' : rest) = '&' : ' ' : lexOp True rest
lexOp _ ('|' : rest) = '|' : ' ' : lexOp True rest
lexOp _ ('^' : rest) = '^' : ' ' : lexOp True rest
lexOp _ ('?' : rest) = '?' : ' ' : lexOp True rest
lexOp _ ('<' : rest) = '<' : ' ' : lexOp True rest
lexOp _ ('>' : rest) = '>' : ' ' : lexOp True rest
lexOp _ (c:rest)     = c : lexOp True rest
