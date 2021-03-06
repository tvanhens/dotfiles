# Overview

This repository contains my personal configurations for Zsh, tmux, Leiningen, and Emacs.

# Getting started

If you're on a Mac, simply download or clone this repository and run `scripts/setup.sh` as an executable. Running with no arguments will enable all features (try this for a list—nothing will be installed until you confirm your selection). Alternatively, you can use `include` or `exclude` to enable or disable particular features, e.g. `setup.sh include emacs` or `setup.sh exclude tree tmuxinator`.

If you're on Linux, you will have to move the dotfiles you want into your home directory manually. You can check [`setup.sh`](https://github.com/raxod502/dotfiles/blob/master/scripts/setup.sh) to see what programs are expected to be installed, and what the minimum versions are.

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [Overview](#overview)
- [Getting started](#getting-started)
- [Emacs](#emacs)
    - [Keyboard shortcut notation](#keyboard-shortcut-notation)
    - [Panic](#panic)
    - [Run commands](#run-commands)
    - [Getting help](#getting-help)
    - [Frames, buffers, and windows](#frames-buffers-and-windows)
    - [Manipulating buffers](#manipulating-buffers)
        - [Switch to an already-open buffer](#switch-to-an-already-open-buffer)
        - [Buffer history](#buffer-history)
        - [Switch to a file within a project](#switch-to-a-file-within-a-project)
        - [Switch to an arbitrary file, or a new file](#switch-to-an-arbitrary-file-or-a-new-file)
        - [Delete a buffer](#delete-a-buffer)
    - [Manipulating windows](#manipulating-windows)
        - [Switch the buffer of a window](#switch-the-buffer-of-a-window)
        - [Open windows](#open-windows)
        - [Move between windows](#move-between-windows)
        - [Close windows](#close-windows)
        - [Window history](#window-history)
    - [Moving within a buffer](#moving-within-a-buffer)
        - [Move by characters](#move-by-characters)
        - [Move within a line](#move-within-a-line)
        - [Move through text](#move-through-text)
        - [Move through Lisp code](#move-through-lisp-code)
            - [`C-M-b` (back one form)](#c-m-b-back-one-form)
            - [`C-M-f` (forward one form)](#c-m-f-forward-one-form)
            - [`C-M-p` (descend backwards)](#c-m-p-descend-backwards)
            - [`C-M-n` (ascend forwards)](#c-m-n-ascend-forwards)
            - [`C-M-u` Ascend backwards](#c-m-u-ascend-backwards)
            - [`C-M-d` (descend forwards)](#c-m-d-descend-forwards)
            - [`C-M-a` (beginning of top-level form)](#c-m-a-beginning-of-top-level-form)
            - [`C-M-e` (end of top-level form)](#c-m-e-end-of-top-level-form)
        - [Jump to an arbitrary location on-screen](#jump-to-an-arbitrary-location-on-screen)
        - [Move through the entire buffer](#move-through-the-entire-buffer)
        - [Jump to a previous location](#jump-to-a-previous-location)
        - [Move the screen](#move-the-screen)
    - [Manipulating text](#manipulating-text)
        - [Cutting (killing), copying, and pasting (yanking)](#cutting-killing-copying-and-pasting-yanking)
        - [Undo and redo](#undo-and-redo)
        - [Miscellaneous](#miscellaneous)
    - [Autocompletion](#autocompletion)
    - [Manipulating Lisp code](#manipulating-lisp-code)
        - [`M-(` (wrap in parentheses)](#m--wrap-in-parentheses)
        - [`M-"` (wrap in double quotes)](#m--wrap-in-double-quotes)
        - [`C-right` (slurp from right)](#c-right-slurp-from-right)
        - [`C-left` (barf to right)](#c-left-barf-to-right)
        - [`C-M-left` (slurp from left)](#c-m-left-slurp-from-left)
        - [`C-M-right` (barf to left)](#c-m-right-barf-to-left)
        - [`M-s` (splice)](#m-s-splice)
        - [`M-up` (splice killing backwards)](#m-up-splice-killing-backwards)
        - [`M-down` (splice killing forwards)](#m-down-splice-killing-forwards)
        - [`M-r` (raise)](#m-r-raise)
        - [`M-S` (split)](#m-s-split)
        - [`M-J` (join)](#m-j-join)
        - [`M-?` (convolute)](#m--convolute)
        - [Additional notes](#additional-notes)
    - [Interacting with Elisp code](#interacting-with-elisp-code)
    - [Interacting with Clojure code](#interacting-with-clojure-code)
        - [Starting a REPL](#starting-a-repl)
        - [Interacting with the REPL](#interacting-with-the-repl)
        - [Using the REPL](#using-the-repl)
    - [Version control](#version-control)
    - [Helm](#helm)
- [Contributing](#contributing)
    - [Documentation](#documentation)
    - [Commit history](#commit-history)
        - [Commit messages](#commit-messages)
        - [Commit history](#commit-history)
    - [Code style](#code-style)

<!-- markdown-toc end -->

# Emacs

![Emacs vs. Vim cartoon](http://eliot.s3.amazonaws.com/eliotlash.com/0010_en_vi-vs-emacs.png)

## Keyboard shortcut notation

- `f` means press the "F" key.
- `F` means press the "F" key while holding Shift.
- `C-f` means press the "F" key while holding Control.
- `M-f` means press the "F" key while holding Meta. On Mac keyboards, Meta is labeled Alt.
- `M-^` means press the "6" key while holding both Shift and Meta.
- `C-M-f` means press the "F" key while holding both Control and Meta.
- `C-c M-J` means press the "C" key while holding Control, then let go and press the "J" key while holding both Shift and Control.
- `S-left` means press the left arrow key while holding Shift.
- `s-f` means press the "F" key while holding Super. On Mac keyboards, Super is labeled Command.

## Panic

Command | Action
--- | ---
`C-g` | Cancel

## Run commands

Command | Action
--- | ---
`M-x` | Select a command to run using [`helm`](#helm)

In Emacs, many commands are bound to keyboard shortcuts. However, there are many more commands than possible keyboard shortcuts, so you can instead run commands by name. Thanks to the `helm-smex` package, commands that you have used recently or frequently are placed near the top of the list of suggestions.

## Getting help

Command | Action
--- | ---
`C-h k` | Describe what a keybinding does
`C-h f` | Get documentation for a function (select using [`helm`](#helm))
`C-h v` | Get documentation for a variable (select using [`helm`](#helm))
`C-h m` | Get documentation about the modes currently active
`C-h t` | View the Emacs tutorial

## Frames, buffers, and windows

Emacs uses some rather idiosyncratic terminology to refer to the various rectangular objects that it uses to contain text. Their definitions are as follows:

Emacs name | Conventional name
--- | ---
Buffer | File
Window | Panel
Frame | Window

In Emacs, not all buffers have to be files. For instance, you can have a buffer for an external process that you have run, which will show the output of the process. Or you can have a buffer that shows the documentation of a function, even if the contents of the buffer do not exist anywhere on the filesystem. Or you can create any number of your own buffers, and then decide if you want to save them to files or not.

What most applications call windows, Emacs calls frames. Unlike in most applications, having more than one frame is not always necessary for productive work, since it is very easy to put more than one window in a frame. Most applications would call this a sort of "split-screen" functionality, but it is integrated into the fundamental behavior of Emacs.

Each window has a buffer, but there can be buffers that are not associated with any window. These are all listed by `C-x b`. You can have multiple windows onscreen at the same time, but within the same

Most people quickly end up with a large number of buffers open (this is not a problem, since Emacs can handle a large number of buffers without slowing down) and have a few of these buffers displayed in a small number of windows (say 1-8) in a single frame.

## Manipulating buffers

You should read [Frames, buffers, and windows](#frames-buffers-and-windows) if you have not already.

### Switch to an already-open buffer

Command | Action
--- | ---
`C-x b` | Switch the buffer of the current window using [`helm`](#helm)

There is a [known issue](https://github.com/raxod502/dotfiles/issues/41) where sometimes `C-x b` starts using [`ido-mode`](#switch-to-an-arbitrary-file-or-a-new-file) instead of `helm`. If this happens, press `M-x helm-mode` to fix it. If you find out how to reproduce this behavior, [do tell](https://github.com/raxod502/dotfiles/issues/41)!

### Buffer history

Command | Action
--- | ---
`C-x left` | Switch to the previous buffer for the current window
`C-x right` | Switch to the next buffer for the current window

These commands are like "undo" and "redo" for the history of buffers you have had open in a particular window.

### Switch to a file within a project

Command | Action
--- | ---
`C-c p b` | Switch to a buffer in the current project using [`helm`](#helm)
`C-c p f` | Open a file in the current project using [`helm`](#helm)
`C-c p p` | Open a file in a different project using [`helm`](#helm)
`C-c p h` | Combination of `C-c p b`, `C-c p f`, and `C-c p p`
`C-c p F` | Open a file in any project using [`helm`](#helm) (warning: slow)

The `projectile` package provides some functionality for grouping files into "projects". By default, any folders that are Git repositories are considered projects. Folders will be added automatically to the list of known projects as you visit them.

Any non-file buffers you open while in a Projectile project will be marked as associated with that project, and will show up under `C-c p b` along with any buffers for files in the project.

You can view the project for the current buffer in the mode line at the bottom of Emacs. If you are in the `dotfiles` project, for instance, then your mode line might look something like this:

```
[*] init.el        72% (389,30)  [dotfiles]  (Emacs-Lisp Paredit AggrIndent)
```

### Switch to an arbitrary file, or a new file

Command | Action
--- | ---
`C-x C-f` | Open or create a file

This uses IDO mode.

### Delete a buffer

Command | Action
--- | ---
`C-x k` | Kill a buffer using [`helm`](#helm)
`q` | Dismiss a transient buffer

Examples of transient buffers are those generated by e.g. `C-h k` or `C-h f`, or documentation or stack trace buffers created by CIDER.

## Manipulating windows

You should read [Frames, buffers, and windows](#frames-buffers-and-windows) if you have not already.

### Switch the buffer of a window

See [Manipulating buffers](#manipulating-buffers).

### Open windows

Command | Action
--- | ---
`C-x 2` | Split the current window horizontally
`C-x 3` | Split the current window vertically

### Move between windows

Command | Action
--- | ---
`S-left` | Move to the window directly to the left of the cursor
`S-right` | Move to the window directly to the right of the cursor
`S-up` | Move to the window directly above the cursor
`S-down` | Move to the window directly below the cursor

Suppose you have a window arrangement like this:

```
+-----------------------+
|                       |
|           A           |
|                       |
+-----------+-----------+
|           |           |
|     B     |     C     |
|           |           |
+-----------+-----------+
```

If you are in `A` and press `S-down`, then whether you move to `B` or to `C` is dependent on which side of `A` the cursor is on when you press `S-down`.

### Close windows

Command | Action
--- | ---
`C-x 0` | Close the current window
`C-x 1` | Close all windows other than the current window

### Window history

Command | Action
--- | ---
`C-c left` | Previous window arrangement
`C-c right` | Back to most recent window arrangement

Note that this is a linear history, so if you do something after undoing with `C-c left`, then `C-c right` will no longer work.

## Moving within a buffer

### Move by characters

Command | Action
--- | ---
`C-b` or `left` | Back one character
`C-f` or `right` | Forward one character
`C-p` or `up` | Up one line
`C-n` or `down` | Down one line

You may ask why to use the `C-letter` versions of these commands. Many people find them faster and/or more ergonomically sound. This diagram from the Emacs tutorial may help you remember the keybindings:

```
                          Previous line, C-p
                                  :
                                  :
   Backward, C-b .... Current cursor position .... Forward, C-f
                                  :
                                  :
                            Next line, C-n
```

### Move within a line

Command | Action
--- | ---
`C-a` | Beginning of line
`C-e` | End of line
`M-m` | First non-whitespace character in line

### Move through text

Command | Action
--- | ---
`M-b` | Back one word
`M-f` | Forward one word
`M-a` | Back one sentence
`M-e` | Forward one sentence

In Vim, the concept of a word is very precise, so it is easy to predict exactly where you will end up after performing a move-by-word command. This doesn't appear to be the case in Emacs—the word movement commands are a little hard to predict.

### Move through Lisp code

Command | Action
--- | ---
`C-M-b` | Back one form
`C-M-f` | Forward one form
`C-M-p` | Descend backwards
`C-M-n` | Ascend forwards
`C-M-u` | Ascend backwards
`C-M-d` | Descend forwards
`C-M-a` | Beginning of top-level form
`C-M-e` | End of top-level form

The best way to explain these commands is by example. In the following code snippets, the location of the cursor is shown as a `|`.

#### `C-M-b` (back one form)

```
(reduce + (take-while (partial > 4000000) (filter ev|en? (fibonacci))))
(reduce + (take-while (partial > 4000000) (filter |even? (fibonacci))))
(reduce + (take-while (partial > 4000000) (|filter even? (fibonacci))))
(reduce + (take-while (partial > 4000000) |(filter even? (fibonacci))))
(reduce + (take-while |(partial > 4000000) (filter even? (fibonacci))))
(reduce + (|take-while (partial > 4000000) (filter even? (fibonacci))))
(reduce + |(take-while (partial > 4000000) (filter even? (fibonacci))))
(reduce |+ (take-while (partial > 4000000) (filter even? (fibonacci))))
(|reduce + (take-while (partial > 4000000) (filter even? (fibonacci))))
|(reduce + (take-while (partial > 4000000) (filter even? (fibonacci))))
```

#### `C-M-f` (forward one form)

```
(reduce + (take-while (par|tial > 4000000) (filter even? (fibonacci))))
(reduce + (take-while (partial| > 4000000) (filter even? (fibonacci))))
(reduce + (take-while (partial >| 4000000) (filter even? (fibonacci))))
(reduce + (take-while (partial > 4000000|) (filter even? (fibonacci))))
(reduce + (take-while (partial > 4000000)| (filter even? (fibonacci))))
(reduce + (take-while (partial > 4000000) (filter even? (fibonacci))|))
(reduce + (take-while (partial > 4000000) (filter even? (fibonacci)))|)
(reduce + (take-while (partial > 4000000) (filter even? (fibonacci))))|
```

#### `C-M-p` (descend backwards)

Forms for which this command can really shine are not common in Clojure because of the threading macro (`->`). However, for illustrative purposes, here is an example:

```
(assoc (merge n (assoc (assoc m :a 1) :b 2)) :c 3)|
(assoc (merge n (assoc (assoc m :a 1) :b 2)) :c 3|)
(assoc (merge n (assoc (assoc m :a 1) :b 2)|) :c 3)
(assoc (merge n (assoc (assoc m :a 1) :b 2|)) :c 3)
(assoc (merge n (assoc (assoc m :a 1|) :b 2)) :c 3)
```

#### `C-M-n` (ascend forwards)

```
(reduce + (take-while (par|tial > 4000000) (filter even? (fibonacci))))
(reduce + (take-while (partial > 4000000)| (filter even? (fibonacci))))
(reduce + (take-while (partial > 4000000) (filter even? (fibonacci)))|)
(reduce + (take-while (partial > 4000000) (filter even? (fibonacci))))|
```

#### `C-M-u` Ascend backwards

```
(reduce + (take-while (partial > 4000000) (filter ev|en? (fibonacci))))
(reduce + (take-while (partial > 4000000) |(filter even? (fibonacci))))
(reduce + |(take-while (partial > 4000000) (filter even? (fibonacci))))
|(reduce + (take-while (partial > 4000000) (filter even? (fibonacci))))
```

#### `C-M-d` (descend forwards)

```
|(reduce + (take-while (partial > 4000000) (filter even? (fibonacci))))
(|reduce + (take-while (partial > 4000000) (filter even? (fibonacci))))
(reduce + (|take-while (partial > 4000000) (filter even? (fibonacci))))
(reduce + (take-while (|partial > 4000000) (filter even? (fibonacci))))
```

#### `C-M-a` (beginning of top-level form)

```
(when (member 'clojure-mode radon-packages)
  (add-hook 'clojure-mo|de-hook (lambda () (eldoc-mode 1))))


```

```
|(when (member 'clojure-mode radon-packages)
  (add-hook 'clojure-mode-hook (lambda () (eldoc-mode 1))))


```

#### `C-M-e` (end of top-level form)

```
(when (member 'clojure-mode radon-packages)
  (add-hook 'clojure-mo|de-hook (lambda () (eldoc-mode 1))))


```

```
(when (member 'clojure-mode radon-packages)
  (add-hook 'clojure-mode-hook (lambda () (eldoc-mode 1))))
|
```

### Jump to an arbitrary location on-screen

The `ace-jump-mode` package provides a mechanism for jumping to any piece of text you can see on the screen, even if it is in a different window. To use it, pick a word that you would like to jump to. Then press `C-c C-SPC` and enter the first letter of that word. You will notice that the letter you were looking at has been replaced by a different letter. Type this letter to jump to that location.

By adding a `C-u`, you can jump to any character, not just one at the beginning of a word. Or, you can jump to an arbitrary line by adding a second `C-u`. (For this last option, you do not need to provide a character—just press `C-u C-u C-SPC` and type the letter that appears on the line you desire.)

Command | Action
--- | ---
`C-c C-SPC` | Jump to a word
`C-u C-c C-SPC` | Jump to a character
`C-u C-u C-c C-SPC` | Jump to a line

### Move through the entire buffer

Command | Action
--- | ---
`M-<` | Beginning of buffer
`M->` | End of buffer
`M-g g` | Go to line number

### Jump to a previous location

Command | Action
--- | ---
`C-u C-u C-SPC` | Set a mark at the cursor location
`C-u C-SPC` | Jump to the previous mark location in the current buffer
`C-x C-@` | Jump to the previous mark location across all buffers

Many "jump" commands, such as `M-<` and `M->`, will set a mark at the cursor location before they move the cursor. You can tell this is happening if the text "Mark set" appears in the minibuffer. So to quickly check some information at the top of a file and then return to your previous location is just `M-<` followed by `C-u C-SPC`.

### Move the screen

Command | Action
--- | ---
`C-l` | Move current line to center, then top, then bottom
`C-c C-M-l` | Move current form to center

## Manipulating text

### Cutting (killing), copying, and pasting (yanking)

Emacs has a bit of a different nomenclature for its editing operations than most other editors. And if you previously used Vim, you will probably be even more confused. Here is a handy table:

Emacs | Every other editor | Vim
--- | --- | ---
Kill | Cut | Kill
Copy | Copy | Yank
Yank | Paste | Paste

Command | Action
--- | ---
`C-SPC` | Mark the beginning of a selection
`C-w` | Kill the selection
`M-DEL` | Kill the previous word
`M-d` | Kill the next word
`C-k` | Kill the rest of the current line
`M-w` | Copy the selection
`C-y` | Yank the most recently killed/copied text
`M-y` | Cycle back through the history of killed/copied text

Note `C-k`, by default, will not kill the newline at the end of the line unless the line is empty. So, to kill a non-empty line you will have to do `C-a C-k C-k`.

See [Yanking Earlier Kills](https://www.gnu.org/software/emacs/manual/html_node/emacs/Earlier-Kills.html) in the Emacs manual for an explanation of `M-y` does. The important thing to remember is that you have to press `C-y` first, before you can start pressing `M-y`.

### Undo and redo

Command | Action
--- | ---
`C-/` | Undo
`M-/` | Redo
`C-x u` | Visualize undo tree

### Miscellaneous

Command | Action
--- | ---
`M-^` | Join line with previous, collapsing whitespace
`M-q` | Wrap text to 70 characters (also works for Lisp docstrings)
`C-x f` | Set the text-wrapping width for the current buffer only
`M-x markdown-toc-generate-toc` | Generate a Markdown table of contents at the cursor
`C-u M-x markdown-toc-generate-toc` | Regenerate an existing Markdown table of contents

## Autocompletion

Command | Action
--- | ---
`TAB` | Accept the selected completion
`up`/`down` | Select a completion
`M-1`-`M-0` | Select one of the first ten completions
`RET` | Accept the selected completion, if you have explicitly interacted with the completions menu

## Manipulating Lisp code

> "If you think paredit is not for you, then you need to become the kind of person that paredit is for." -- Phil Hagelberg

The following commands are provided by the `paredit` package. At first, it may seem like the large number of commands must make editing Lisp code more complicated. But once you become accustomed to them, you will be editing *much* more efficiently than you were before. The `aggressive-indent` package is a perfect complement to `paredit`, and the two combined make it so that you can read the structure of your code by indentation and just ignore the parentheses.

Command | Action
--- | ---
`M-(` | Wrap next form in parentheses
`M-"` | Wrap next form in double quotes
`C-right` | Slurp from the right
`C-left` | Barf to the right
`C-M-left` | Slurp from the left
`C-M-right` | Barf to the left
`M-s` | Splice current form
`M-up` | Kill to beginning of current form and splice
`M-down` | Kill to end of current form and splice
`M-r` | Kill on either side of next form and splice (AKA raise)
`M-S` | Split current form at cursor location
`M-J` | Join forms on either side of cursor location
`M-?` | Reverse nesting of forms (AKA convolute)

The best way to explain these commands is by example. In the following code snippets, the location of the cursor is shown as a `|`.

### `M-(` (wrap in parentheses)

```
(foo |bar baz)
(foo (|bar) baz)
```

### `M-"` (wrap in double quotes)

```
(foo |bar baz)
(foo "|bar" baz)
```

### `C-right` (slurp from right)

```
(foo (bar |baz) quux zot)
(foo (bar |baz quux) zot)
```

### `C-left` (barf to right)

```
(foo (bar |baz quux) zot)
(foo (bar |baz) quux zot)
```

### `C-M-left` (slurp from left)

```
(foo bar (baz |quux zot))
(foo (bar baz |quux zot))
```

### `C-M-right` (barf to left)

```
(foo (bar baz |quux zot))
(foo bar (baz |quux zot))
```

### `M-s` (splice)

```
(foo (bar |baz) quux zot)
(foo bar |baz quux zo)
```

### `M-up` (splice killing backwards)

```
(foo (bar |baz) quux zot)
(foo |baz quux zot)
```

### `M-down` (splice killing forwards)

```
(foo (bar| baz) quux zot)
(foo bar| quux zot)
```

### `M-r` (raise)

```
(foo (bar| (baz quux) zot) fum)
(foo |(baz quux) fum)
```

### `M-S` (split)

```
(foo (bar| baz quux) zot)
(foo (bar|) (baz quux) zot)
```

### `M-J` (join)

```
(foo (bar)| (baz quux) zot)
(foo (bar| baz quux) zot)
```

### `M-?` (convolute)

The default keybinding for `paredit-convolute-sexp` is probably quite appropriate given most people's first reaction to it. However, it is very useful in one particular case: reversing the nesting of forms. Here is an example, where a `let` form is broadened in scope so that a symbol it binds is available in a higher form:

```
(apply +
       (concat
         (filter even? the-numbers)
         (let [the-numbers (range 50)]|
           (remove #(zero? (mod % 3))
                   the-numbers))))
```

```
(apply +
       (let [the-numbers (range 50)]
         (concat
           (filter even? the-numbers)
           (remove #(zero? (mod % 3))
                   the-numbers))))
```

Note that I had to move a line break in order to make the formatting look nice.

### Additional notes

Note that, by default, there are no keybindings analogous to `M-(` but for square brackets or curly braces. As substitutes, you can use `[ C-right` and `{ C-right`.

The best way to remember the slurp/barf keybindings, in my opinion, is to keep in mind that the arrow key points in the direction in which the parenthesis moves.

You may have to substitute `ESC C-left` and `ESC C-right` for `C-M-left` and `C-M-right` in order for your terminal emulator to send the correct key signals.

Remember that strings are also forms, so you can use most of the Paredit bindings to manipulate strings as well as parenthetical forms.

If you really need to bypass Paredit temporarily, you can precede your command with `C-u`. But these times should be rare.

## Interacting with Elisp code

Command | Action
--- | ---
`C-x C-e` | Evaluate the form before the cursor
`C-M-x` | Evaluate the top-level form surrounding or before the cursor
`M-:` | Enter a form to evaluate
`C-h k` | Show documentation for a function (by default the one at the cursor)
`C-h v` | Show documentation for a variable (by default the one at the cursor)
`M-x find-function` | Jump to the definition of a function (uses [`helm`](#helm))
`M-x find-variable` | Jump to the definition of a variable (uses [`helm`](#helm))
`M-x find-function-at-point` | Jump to the definition of the function at the cursor
`M-x find-variable-at-point` | Jump to the definition of the variable at the cursor

## Interacting with Clojure code

### Starting a REPL

Command | Action
--- | ---
`C-c M-j` | Start a REPL
`C-c C-d C-d` | Show documentation for a symbol (by default the one at the cursor)
`M-.` | Jump to the definition of a symbol (by default the one at the cursor)
`M-*` | Jump back after a `M-.`

If the current file is in a project (that is, you can find a `project.clj` file by looking upwards in the filesystem), then a REPL for that project will be started. Otherwise, a REPL that is not associated with any project will be started. (This functionality is just like running `lein repl`, because that is what `C-c M-j` does.)

Note that most "intelligent" Clojure functionality requires a running REPL for the current project.

### Interacting with the REPL

Command | Action
--- | ---
`C-x C-e` | Evaluate the form before the cursor in the REPL
`C-M-x` | Evaluate the top-level form surrounding or before the cursor in the REPL
`C-c M-n` | Switch the REPL to the namespace defined by the current file

### Using the REPL

Command | Action
--- | ---
`M-p` | Previous command in history
`M-n` | Next command in history
`C-c M-n` | Switch to a namespace using Helm
`C-c C-c` | Interrupt evaluation (this doesn't *always* work, though)
`C-c C-o` | Clear the output of the last command (useful for large outputs that make Emacs slow)
`C-c C-q` | Quit the REPL

Note that, just like Zsh, when you cycle through past commands with `M-p` and `M-n`, if you have already typed part of a command, only past commands that start with the same prefix will be shown. This even works with Paredit mode, so that the matching parentheses will not mess things up.

Don't forget that the REPL is a regular text buffer at its core, so all of Emacs' navigation and editing commands will still work.

## Version control

Command | Action
--- | ---
`C-x g` | Open [`magit`](https://github.com/magit/magit)

Magit is not officially supported yet due to issues with [Keychain integration](https://github.com/raxod502/dotfiles/issues/51) and [commiter information](https://github.com/raxod502/dotfiles/issues/52).

## Helm

The `helm` package provides an interface for selecting among multiple choices that is much easier to use than Emacs' default. This interface is used for most commands that require selecting something—a buffer, a file, a command, and so on. The `helm-projectile` package extends this interface to `projectile` commands.

Here is a list of frequent commands that use `helm`:

Command | Action
--- | ---
`M-x` | Run an arbitrary command
`C-h f` | Get documentation for a function
`C-h v` | Get documentation for a variable
`M-x find-function` | Jump to function definition
`M-x find-variable` | Jump to variable definition
`C-x b` | Switch the buffer of the current window
`C-c p b` | Switch to a buffer in the current project
`C-c p f` | Open a file in the current project
`C-c p p` | Open a file in a different project
`C-c p h` | Combination of `C-c p b`, `C-c p f`, and `C-c p p`
`C-c p F` | Open a file in any project
`C-x k` | Kill a buffer

The `helm` buffer displays a list of suggestions, which you can filter by typing. There are two filtering modes: fuzzy and literal. If the text you enter has no spaces, then fuzzy filtering is used. In this mode, matching suggestions must have all the characters in your query, in order, but not necessarily contiguous. So, `ffap` would match `find-file-at-point` or `diff-backup`. If the text you enter has at least one space, then literal filtering is used. In this mode, suggestions have to contain each of the space-separated components of your query, but they can be in any order. So, `face cust` would match `customize-face` but would not `file-cache-add-directory-using-locate` (which would match if you had no space).

The primary way to get to the suggestion you want in Helm is just to type more—the intelligent matching makes this very convenient—but you can also use `up` and `down` to select a candidate.

You can press `C-j` to open a temporary buffer to preview the current selection. For selecting a buffer or file, this is a preview of the contents of the buffer or file. For `M-x`, `C-h f`, or `C-h v`, this is the documentation of the selected function or variable. Note that there are some commands, such as `C-x k`, where this doesn't seem to work.

# Contributing

If you find any problems or have any ideas for improvements, please do not hesitate to [open an issue](https://github.com/raxod502/dotfiles/issues/new), or—even better—[a pull request](https://github.com/raxod502/dotfiles/compare).

However, without attention to quality, all code becomes unmaintainable. This is especially true for dotfiles, so please try to follow the guidelines in this section when contributing code to this repository. I won't reject contributions just because of a missing period, but it is polite to put in some effort to make it easier for future contributors to maintain your code.

If don't have any problems, but still want to help out, check out [the currently open issues](https://github.com/raxod502/dotfiles/issues)—I can use all the help I can get!

## Documentation

> Every line or logical grouping of lines of code in every dotfile **must** have an explanatory comment.

[![Documentation cartoon](http://www.datamation.com/img/2009/12/documentation-please.jpg)](http://www.datamation.com/cnews/article.php/3852701/Tech-Comics-Software-Documentation.htm)

At the very minimum, you must explain what the code is supposed to be doing. This way, people making later modifications can make sure they are not breaking its original functionality.

```
# Open new panes in the same directory as the current pane.
bind % split-window -h -c "#{pane_current_path}"
bind '"' split-window -v -c "#{pane_current_path}"
```

If the line modifies some default setting, you should also make note of what the default was. This makes it easier to tell what will happen if the line is removed.

```
;;; Show completions instantly, rather than after half a second.
(setq company-idle-delay 0)
```

If you are copying or adapting code from somewhere else, please provide any relevant links.

```
;;; Add mouse support
;;; Based on http://stackoverflow.com/a/8859057/3538165
(unless (display-graphic-p)
  (xterm-mouse-mode t)
  ;; Enable scrolling.
  (global-set-key [mouse-4]
                  (lambda ()
                    (interactive)
                    (scroll-down 1)))
  (global-set-key [mouse-5]
                  (lambda ()
                    (interactive)
                    (scroll-up 1))))
```

If it is not immediately obvious why a piece of code is necessary, you **must** explain what problem it solves or what functionality it is intended to change.

```
;;; Sometimes in the CIDER REPL, when Emacs is running slowly, you can
;;; manage to press TAB before the Company completions menu pops
;;; up. This makes a Helm completions buffer appear, which is
;;; disorienting. So we reset TAB to its default functionality
;;; (i.e. indent only) in the CIDER REPL.
(setq cider-repl-tab-command 'indent-for-tab-command)
```

In general, try to find elegant solutions instead of hacks. ("Temporary" hacks have a nasty habit of becoming permanent.) Sometimes, though, there is no alternative. If this is the case, please explain as thoroughly as possible how the hack works and why it is necessary.

I have [an issue tag](https://github.com/raxod502/dotfiles/issues?q=is%3Aissue%20label%3Ahack%20) for hacks, so that they can hopefully be replaced with better solutions someday.

```
           :injections [;; Modify the alembic/distill function to work without needing a
                        ;; project.clj file. This is a hack! It works simply by
                        ;; telling alembic not to look for repositories in the project.clj.
                        ;; However, this is a global override, so if you need to use one
                        ;; of the repositories in the project.clj, you must either pass
                        ;; the :repositories key explicitly, or pass the keyword :project
                        ;; to suppress this hack and allow alembic to search project.clj
                        ;; for repositories.
                        (require 'alembic.still)
                        (alter-var-root
                          #'alembic.still/distill
                          (fn [distill]
                            (fn [dependencies & args]
                              (if (= (first args) :project)
                                (apply distill dependencies (rest args))
                                (apply distill dependencies :repositories
                                       [["central"
                                         {:snapshots false
                                          :url "https://repo1.maven.org/maven2/"}]
                                        ["clojars"
                                         {:url "https://clojars.org/repo/"}]]
                                       args)))))
```

## Commit history

> Try to generate a history that will be as easy as possible for future contributors to read and understand.

[![XKCD: Git Commit](http://imgs.xkcd.com/comics/git_commit.png "Merge branch 'asdfasjkfdlas/alkdjf' into sdkjfls-final")](https://xkcd.com/1296/)

### Commit messages

Follow the generally accepted guidelines for [good Git commit messages](http://chris.beams.io/posts/git-commit/):

> 1. Separate subject from body with a blank line
> 2. Limit the subject line to 50 characters
> 3. Capitalize the subject line
> 4. Do not end the subject line with a period
> 5. Use the imperative mood in the subject line
> 6. Wrap the body at 72 characters
> 7. Use the body to explain what and why vs. how

```
commit 3a6edb77af5e0f220178966f65de9e444d90bfdb
Author: Radon Rosborough <radon.neon@gmail.com>
Date:   Tue Aug 9 22:45:37 2016 -0600

    Don't use source or expand aliases

    Since the .zshrc.aliases system has been removed, these features are no
    longer needed.

    This means we need to add the 'set -e' and 'set -o pipefail' flags on
    every script, once again.
```

When in doubt, explain further. Your future self, and other contributors, will thank you.

### Commit history

Each commit should represent one and only one logical change. Sometimes, it's impractical to separate a refactor into multiple parts, but this is a rare situation.

Instead of sticking a one-line typo fix into your main commit, **make it a separate commit**. There is no such thing as too many commits: more commits means easier bisection and reversion.

However, **do** try to ensure that you don't create intermediate states where things don't compile or are otherwise broken. This makes it harder to bisect.

```
* 5633900 - Replace underscores with dashes in script names (3 days ago) <Radon Rosborough>
* 6554116 - Remove references to unused files (3 days ago) <Radon Rosborough>
* f4c3d67 - Ensure at least version 2.2 of tmux (3 days ago) <Radon Rosborough>
* 7a8f274 - Downcase variable in install_zsh.sh (3 days ago) <Radon Rosborough>
* d815e36 - Remove .zshrc.aliases (3 days ago) <Radon Rosborough>
* 55ff743 - Inject clojure.core/refer-clojure as ./rc (3 days ago) <Radon Rosborough>
* ff8bb54 - Add .gitconfig and corresponding setup.sh support (4 days ago) <Radon Rosborough>
* bba801e - Downcase local variable in install_emacs.sh (4 days ago) <Radon Rosborough>
* 85cfbbd - Suppress 'ls does not support --dired' warning (4 days ago) <Radon Rosborough>
```

## Code style

> Value consistency and common sense over theoretical correctness, but try to follow generally accepted guidelines.

[![XKCD: Code Quality](http://imgs.xkcd.com/comics/code_quality.png)](https://xkcd.com/1513/ "I honestly didn't think you could even USE emoji in variable names. Or that there were so many different crying ones.")

- Comments should end with a period unless they are end-of-line comments spanning only a few words. They should be capitalized, complete sentences.
- Use the Emacs defaults for formatting Elisp. By definition, these are correct.
- Check out [the Clojure style guide](https://github.com/bbatsov/clojure-style-guide). In particular, use `;` for end-of-line comments, `;;` for line comments, `;;;` for top-level line comments, and `;;;;` for section headers.
