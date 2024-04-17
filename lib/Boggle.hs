module Boggle (boggle) where

import Data.List (foldl')
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map
import Data.Set (Set)
import qualified Data.Set as Set

type Board = [String]

boggle :: Board -> [String] -> [(String, [(Int, Int)])]
boggle board words = foldl' (findWords board) [] words

findWords :: Board -> [(String, [(Int, Int)])] -> String -> [(String, [(Int, Int)])]
findWords board acc word =
    let row = length board
        col = length (head board)
        validCoords = Set.fromList [(r, c) | r <- [0 .. row - 1], c <- [0 .. col - 1]]
        coordsVec = []
        result = dfs board word 0 validCoords coordsVec
    in if result /= [] then (word, reverse result) : acc else acc

dfs :: Board -> String -> Int -> Set (Int, Int) -> [(Int, Int)] -> [(Int, Int)]
dfs _ [] _ _ path = path
dfs board (w : ws) idx validCoords path =
    let neighbors (r, c) = [(r + dr, c + dc) | dr <- [-1, 0, 1], dc <- [-1, 0, 1], (r + dr, c + dc) `Set.member` validCoords]
        validNeighbors = filter (\(r, c) -> board !! r !! c == w) (neighbors (last path))
        nextCoords = Set.delete (last path) validCoords
    in case validNeighbors of
        [] -> []
        _ -> foldl' (\acc (r, c) -> dfs board ws (idx + 1) nextCoords ((r, c) : path) ++ acc) [] validNeighbors
