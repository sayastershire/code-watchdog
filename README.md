# Code Watchdog

Welcome to a very very very early release of Code Watchdog! So early that the only thing it supports is just LaTeX on macOS (been hackintoshing since Big Sur beta, don't judge me!) and Linux (arch btw), accidentally and ineffectively.

Contributions are welcome, perhaps?

## Reason to exist
- VSCode sucks (I mean electron sucks, so that means Atom too).
- VSCode's Latex Workshop always return userspace compiler call with error, e.g. "call xelatex NOENT". So irritating.
- I have no good reason to learn Vimscript just to get the 'save' call from it.
- Neither do I want to change my habit by using emacs.
- LightTable needs Java to run (oh all the bad memories of using IntelliJ).
- Xcode is bloat.
- I want to use my favourite IDE while there's something taking watch of my files.

## Dependencies
### General
- XeLaTeX
- fswatch ( `brew install fswatch` or `yay -S fswatch` )

## Supported Files
- LaTeX

## Supported Operating Systems
- macOS
- Linux (though I am using another project for the watchdog part, so it will be ineffective until I get to code with inotify)

## Planned Support? (it's based on what I code)
- C
- C++
- Sass / SCSS
- Anything that needs to be compiled?
- Windows (using Powershell, perhaps?)

n.b.: can we even use Python here? like how to call the compiler from there by just using the library?
