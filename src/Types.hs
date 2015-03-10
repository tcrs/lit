module Types where

import Data.Text 

data SourceLoc = SourceLoc String Int deriving (Show, Eq)
data Chunk = Def SourceLoc Text [Part] | Include String Text | Prose Text deriving (Show, Eq)
data Part = Code Text | Ref Text Text deriving (Show, Eq)
type Program = [Chunk]

isDef chunk =
    case chunk of
    Def _ _ _ -> True
    Include _ _ -> False
    Prose _ -> False
getName chunk =
    case chunk of
    Def _ name _ -> name
    _ -> error "cannot retrieve name, not a def"
getParts chunk =
    case chunk of
    Def _ _ parts -> parts
    _ -> error "cannot retrieve parts, not a def"
getLineNo chunk =
    case chunk of
    Def line _ _ -> line
    _ -> error "cannot retrieve line number, not a def"
getProseText chunk = 
    case chunk of
    Prose txt -> txt
    _ -> error "cannot retrieve text, not a prose"


