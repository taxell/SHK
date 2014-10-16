module SHJKeywords where

import Data.Maybe

translate :: String -> String
translate s = maybe s id (lookupKey s)

lookupKey :: String -> Maybe String
lookupKey s = case s of
	        "abstrakt"     -> Just "abstract"
	        "säkerställ"   -> Just "assert"
	        "boolesk"      -> Just "boolean"
	        "bryt"         -> Just "break"
	        "bitgrupp"     -> Just "byte"        
	        "fall"         -> Just "case"
	        "fånga"        -> Just "catch"
	        "klass"        -> Just "class"
	        "teck"         -> Just "char"
	        "konst"        -> Just "const"
	        "fortsätt"     -> Just "continue"
	        "standardfall" -> Just "default"
	        "gör"          -> Just "do"
	        "dubbel"       -> Just "double"
	        "annars"       -> Just "else"
	        "uppräk"       -> Just "enum"
	        "utökar"       -> Just "extends"
	        "falskt"       -> Just "false"
	        "slutgiltig"   -> Just "final"
	        "slutligen"    -> Just "finally"
	        "flyt"         -> Just "float"
	        "för"          -> Just "for"
	        "gåtill"       -> Just "goto"
	        "om"           -> Just "if"
	        "förverkligar" -> Just "implements"
	        "hämta"        -> Just "import"
	        "instansav"    -> Just "instanceof"
	        "gränssnitt"   -> Just "interface"
	        "hel"          -> Just "int"
	        "lång"         -> Just "long"
	        "inhemsk"      -> Just "native"
	        "ny"           -> Just "new"
	        "inget"        -> Just "null"
	        "paketera"     -> Just "package"
	        "privat"       -> Just "private"
	        "skyddad"      -> Just "protected"
	        "offentlig"    -> Just "public"
	        "återlämna"    -> Just "return"
	        "kort"         -> Just "short"
	        "fast"         -> Just "static"
	        "rigorösfp"    -> Just "strictfp"
	        "stål"         -> Just "super"
	        "samordnad"    -> Just "synchronized"
	        "växel"        -> Just "switch"
	        "denna"        -> Just "this"
	        "kasta"        -> Just "throw"
	        "kastar"       -> Just "throws"
	        "flyktig"      -> Just "transient"
	        "sant"         -> Just "true"
	        "försök"       -> Just "try"
	        "tomhet"       -> Just "void"
	        "instabil"     -> Just "volatile"
	        "medans"       -> Just "while"
	        _              -> Nothing

