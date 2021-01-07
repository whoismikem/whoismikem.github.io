---
name: Pyenv ( Managing Python Versions)
---

# Pyenv ( Managing Python Versions)

Manage multiple versions of python environments on a mac

## Install pyenv
1. Install using brew: `brew install pyenv`
2. Add this to shell startup script: `'eval "$(pyenv init -)"'` ex: `echo 'eval "$(pyenv init -)"' >> ~/.zshrc`

## Using
* List installed python versions: `pyenv versions`
* List available versions to install: `pyenv install -l`
* Install python version 3.8.6: `pyenv install 3.8.6`
* Set active python version: `pyenv global 3.8.6`

