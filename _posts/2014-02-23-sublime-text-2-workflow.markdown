---
layout: post
title: "Sublime Text 2 Workflow"
date: 2014-02-23 13:11:32 -0500
comments: true
categories: 
---
## Prerequisites

#### node.js  
First we'll install node.js, as SublimeLinter depends on it.
```sh
sudo apt-get install build-essential
wget http://nodejs.org/dist/v0.10.26/node-v0.10.26.tar.gz
tar xzf node-v0.10.26.tar.gz
cd node-v0.10.26/
./configure && make && sudo make install
sudo npm install -g jshint
```
#### PHP5  
This is required for all PHP related linting.
```sh
sudo apt-get install php5 php5-cli
```
#### CTags  
We can't have a proper code editor without CTags.
```sh
sudo apt-get install ctags
```

## Sublime Packages

#### [Package manager](https://sublime.wbond.net/installation)
First, install the package manager and restart Sublime Text. The following packages can be downloaded from the Package Manager. It can be accessed by pressing `Ctrl+Shift+P` and typing `package control install package` in the prompt.

#### [Alignment](http://wbond.net/sublime_packages/alignment)
The settings for the Alignment plugin reside in the `Preferences > Package Settings > Alignment > Settings - User` file.
```
{
    "align_indent"           : true,
    "mid_line_tabs"          : false,
    "alignment_chars"        : ["=", ":"],
    "alignment_space_chars"  : ["=", ":"],
    "alignment_prefix_chars" : [
        "+", "-", "&", "|", "<", ">", "!", "~", "%", "/", "*", "."
    ]
}
```
#### [SublimeLinter](https://github.com/SublimeLinter/SublimeLinter-for-ST2)
#### [CTags](https://github.com/SublimeText/CTags)
#### [BracketHighlighter](https://github.com/facelessuser/BracketHighlighter)
#### [Block Cursor Everywhere](https://github.com/ingshtrom/BlockCursorEverywhere)
#### [DocBlockr](https://github.com/spadgos/sublime-jsdocs)

## Sublime Specific Configuration
These settings reside in the `Preferences > Settings - User` file.
#### highlight_line
```
"highlight_line" : true
```

#### highlight_modified_tabs
```
"highlight_modified_tabs" : true
```

#### Global hotkeys
These settings reside in the `Preferences > Key Bindings - User` file.
```
[
    { "keys": ["ctrl+shift+o"], "command": "prompt_open_folder" },
    { "keys": ["ctrl+f5"], "command": "refresh_folder_list" },
    { "keys": ["ctrl+shift+a"], "command": "alignment" }
]
```