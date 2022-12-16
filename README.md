# Homebrew Kubevious/CLI
Tap for Kubevious CLI project [https://github.com/kubevious/cli](https://github.com/kubevious/cli).

## Release Instructions
```sh
$ docker run -it --rm homebrew/brew

brew bump-formula-pr kubevious --url=https://registry.npmjs.org/kubevious/-/kubevious-1.0.30.tgz  --debug
```

### Setup Homebrew Core Repo
```
$ cd "$(brew --repository homebrew/core)"
$ git remote add kubevious https://github.com/kubevious/homebrew-core.git
$ git checkout master
$ brew update
$ git checkout -b kubevious origin/master
```

### Test Formula
```sh
brew tests
brew install --build-from-source kubevious
brew test kubevious
brew audit --strict --online kubevious
```

### Commit changes
```sh
git add Formula/kubevious.rb
git commit -m "Kubevious 1.0.20"
git push --set-upstream kubevious kubevious
```

### Restore Upstream
```sh
git checkout master
git pull origin master
```

### Rebase From Upstream
```sh
git remote add upstream https://github.com/Homebrew/homebrew-core.git

git fetch upstream
git rebase upstream/master
git push origin master --force
```


### Current Errors:
* Formulae in homebrew/core must specify a license.
* GitHub repository not notable enough (<30 forks, <30 watchers and <75 stars)

## Resources
- https://github.com/Homebrew/brew/blob/master/docs/Node-for-Formula-Authors.md
- https://publishing-project.rivendellweb.net/creating-and-running-your-own-homebrew-tap/

- https://docs.brew.sh/How-To-Open-a-Homebrew-Pull-Request

