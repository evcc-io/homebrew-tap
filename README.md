# homebrew-tap 

[![Build Status](https://github.com/evcc-io/homebrew-tap/workflows/Homebrew%20Tap/badge.svg)](https://github.com/evcc-io/homebrew-tap/actions)

Homebrew Cask for [evcc](https://github.com/evcc-io/evcc) ([Homebrew Taps](https://docs.brew.sh/Taps)).

```sh
brew tap evcc-io/tap
brew update
brew install --cask evcc
```

evcc was a formula up to 0.314.5. Homebrew does not upgrade an installed formula to the cask, so `brew upgrade` keeps reporting 0.314.5 as up-to-date. Replace it once:

```sh
brew services stop evcc
brew uninstall evcc
brew install --cask evcc
```

The cask has no `brew services` support. See the [macOS installation guide](https://docs.evcc.io/en/installation/macos) for a launchd agent.
