# rhys.codes

Personal blog built with [Hugo](https://gohugo.io/) and the [Coder](https://github.com/luizdepra/hugo-coder) theme. Deployed to GitHub Pages via GitHub Actions.

## Local development

```
# Clone the repo and run these commands to launch it locally:
git submodule update --init --recursive
brew install hugo
hugo server
```

## Create a new post

```
hugo new posts/my-post.md
```

## Build

```
hugo --gc --minify
```
