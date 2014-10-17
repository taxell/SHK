SHK
===

The SwedisH Kompiler

Do you like Java programming, but would prefer to do so in Swedish? Then
SHK is the tool for you! With SHK you can write your code in Swedish 
and have it compiled to .class files like regular Java code.

About this project
------------------
This project is done entirely for fun and procrastination and should not be 
taken seriously.

###### Content
* src - The Makefile and source code for SHK. (Surprise, surprise ^^)
* editor\_support - Syntax highlighting and such support for editors.
* test\_jsh\_src - .jsh test files

Usage
-----
SHK works by translating your Swedish code into regular Java code and passes that
on to javac along with any arguments sent to SHK, so SHK should be called in the
same way as javac, with the exception that Swedish source code shall have the file
extension ".jsh" (Java in SwedisH) and not ".java".

See the file keywords.txt (or src/JSHKeywords.hs) for translation of the Swedish keywords.


Requirements
------------

javac - SHK translates your Swedish code into regular Java and uses javac to
compile that to bytecode.

A Haskell compiler - The project includes a Makefile that in turn uses GHC, so make 
and GHC are recommended, but not absolutely necessary.


