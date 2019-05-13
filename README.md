# Tmux Now Playing Plugin

**Please note that this is still in the early stages of development. It might not work at all for you, and it doesn't work out of the box for anyone, including me.** However, if you'd like to leave issues or PRs, I'd be happy to review and merge them!

## The Goal

Since I get bored with my music easily, my goal is to have a Tmux player status that works on a variety of players, including iTunes, Spotify, and Pandora. Ideally, the API should make it simple (if not easy) for users to extend with new players.

## Requirements

At the moment, this only works with iTunes on macOS, since that's what I'm using, but I'm certain I'll want to swap something soon.

- Tmux 2.1 or higher
- macOS (tested with Mojave only, but it seems like it would work with other versions too)

## Usage

This plugin introduces the following new status variables:

* `#{player_status}`
* `#{itunes_artist}`
* `#{itunes_album}`
* `#{itunes_track}`

Here's the example in `.tmux.conf`:

    set -g status-right "#{player_icon} #{itunes_status} #{itunes_artist} - #{itunes_track} - #{itunes_album} | %H:%M:%S "

## Installation

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'dysnomian/tmux-now-playing'

Hit `prefix + I` to fetch the plugin and source it.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/robhurring/tmux-now-playing' ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/now-playing.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

## Road map

 - [ ] Performance benchmarks
 - [ ] Screenshots
 - [ ] Settable icons
 - [ ] Player detection
 - [ ] Player priority list
 - [ ] Track info marquee
 - [ ] Spotify scripts
 - [ ] Pandora scripts
 - [ ] Automated testing
 - [ ] Cross-platform compatibility
 - [ ] Track time and track progress
 - [ ] Color track progress bar

### Contributing

PRs and issues are gladly accepted! See the CONTRIBUTING.md doc for guidelines.

## Credits

This is based heavily on @robhurring's [tmux-spotify](https://github.com/robhurring/tmux-spotify). Thanks Rob!
