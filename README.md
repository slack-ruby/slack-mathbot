Slack-Gamebot
=============

[![Build Status](https://travis-ci.org/dblock/slack-mathbot.png)](https://travis-ci.org/dblock/slack-mathbot)

A math bot for Slack.

![](screenshots/two-plus-two.gif)

## Installation

Create a new Bot Integration under [services/new/bot](http://slack.com/services/new/bot).

![](screenshots/register-bot.png)

On the next screen, note the API token.

Run `SLACK_API_TOKEN=<your API token> foreman start`

While it's currently not necessary, uyou may need to set _GIPHY_API_KEY_ in the future, see [github.com/Giphy/GiphyAPI](https://github.com/Giphy/GiphyAPI) for details.

## Production Deployment

See [DEPLOYMENT](DEPLOYMENT.md).

## Usage

### Commands

#### mathbot calculate [expression]

Calculates an expression, currently just basic math. See [Dentaku](https://github.com/rubysolo/dentaku) for what's supported.

#### mathbot

Shows MathBot version and links.

#### mathbot hi

Politely says 'hi' back.

#### mathbot help

Get help.

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md).

## Copyright and License

Copyright (c) 2015, Daniel Doubrovkine, Artsy and [Contributors](CHANGELOG.md).

This project is licensed under the [MIT License](LICENSE.md).
