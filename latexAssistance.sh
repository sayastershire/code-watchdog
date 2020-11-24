#!/usr/bin/env bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		  echo "To-do: supporting GNU/Linux users!"
elif [[ "$OSTYPE" == "darwin"* ]]; then
		  fswatch -0 . | xargs -0 -I {} ./latexCompiler.sh {}
else
		  echo "Sorry, not supporting Windows cucks!"
fi
