# Game of Life Code Exercise

Here's my first pass at a Ruby version of The Game of Life.

Here are the rules:

> The universe of the *Game of Life* is an infinite, two-dimensional orthogonal grid of square *cells*, each of which is in one of two possible states, *alive* or *dead*, (or *populated* and *unpopulated*, respectively). Every cell interacts with its eight *neighbours*, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:
>
> 1. Any live cell with fewer than two live neighbours dies, as if by underpopulation.
> 2. Any live cell with two or three live neighbours lives on to the next generation.
> 3. Any live cell with more than three live neighbours dies, as if by overpopulation.
> 4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

(Source:  [https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life](https://en.wikipedia.org/wiki/Conway's_Game_of_Life))



Some game examples:

![Game_of_life_blinker](https://upload.wikimedia.org/wikipedia/commons/9/95/Game_of_life_blinker.gif)

![Game_of_life_toad](https://upload.wikimedia.org/wikipedia/commons/1/12/Game_of_life_toad.gif)

![132px-Game_of_life_block_with_border.svg](https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Game_of_life_block_with_border.svg/132px-Game_of_life_block_with_border.svg.png)



## Specs

To test the app, run the following command:

```
$ rspec
```

This should be the output:

```
..................

Finished in 0.12322 seconds (files took 0.08304 seconds to load)
18 examples, 0 failures
```

## Things I like about how this design turned out

- Nice thin models
- Well named components (classes, methods, variables etc) that reflect the game's domain
- Well separated concerns with good interfaces (abstracted logic for the rules with dependency injection, and abstracted logic for neighbor logic)
- Components that are well separated and reusable
- Clear abstractions that facilitate extensions in the future without significant refactoring (code is open to alternate rules and alternate cell neighbor logic)
- Lots of unit tests!

## Things I'd like to improve

- Make a cleaner interface for the rules logic (`game_of_life.rb` knows too much about `conway_policy.rb` -- 2-step `evaluate_cells` and `update_cells` is not ideal)
- Refactor `cell_neigbors.rb` (lots of repetitive patterns there)

## If this was more than a code exercise, I would...

- Implement an infinite loop for generations as opposed to defining a specific number
- Fix a current bug where dead cells don't always get analyzed properly
- Flesh out what's being passed to front end -- some combination of cells and `grid.rb`
