-- win.lua
-- Shared win-gauge for the mouse mini-games. Each game
-- fills a gauge of N successes to win, then a unified
-- overlay (the full gauge on a dim field) that a tap
-- dismisses to the menu. A game opts in like it does for
-- notches: win_reset(goal) on enter, win_score() on each
-- success. Meet, find, and pop all follow this convention.

WIN = {
  count = 0,
  goal = 0,
  won = false
}

-- Start a fresh gauge for a run of `goal` successes.

function win_reset(goal)
  WIN.count = 0
  WIN.goal = goal
  WIN.won = false
end

-- Record one success; the goal-th one wins and plays the
-- win sound. No further scoring can happen: the win
-- freezes the game (update_active) and swallows input.

function win_score()
  WIN.count = WIN.count + 1
  if WIN.goal <= WIN.count then
    WIN.won = true
    play(SND.win)
  end
end
