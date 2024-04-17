
# Haskell Boggle

This is a short example program I wrote in Haskell as a potential example in an introductory talk. It demonstrates several interesting concepts:

* Immutable Arrays: The program uses immutable arrays to represent the Boggle board, showcasing how Haskell handles arrays efficiently.
* List/Nondeterminism Monad: The list monad is employed to handle nondeterministic choices, which is particularly useful for Boggle word search.

## Testing
Run ...
        
    cabal test 

in your main directory 
### Boggle Part
The Boggle solver demonstrates the list monad and uses an immutable array for fast indexing. It also showcases a compact way of enumerating neighbors of a position in the array by scanning indices. The list monad handles adjacent values one at a time.

### Depth-First Search (DFS) Algorithm
The core of the Boggle solver relies on a DFS algorithm. Here's how it works:

1. **Base Case**: If the remaining word to find is empty, the current path is returned.
2. **Exploration**: For each valid neighbor of the last position in the path, recursively explore further.
3. **Backtracking**: If no valid neighbors are found, backtrack to the previous position and try other paths.

DFS may not be the best way to solve this problem, but it's sufficient for word sets of over 250k + words and up to 16x16 boards.
#
You can find the complete code and details in the GitHub repository: boggle-haskell
