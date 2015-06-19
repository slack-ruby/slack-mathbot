## Installation

Create a new Bot Integration under [services/new/bot](http://slack.com/services/new/bot).

![](screenshots/register-bot.png)

On the next screen, note the API token.

## Deploy Slack-Gamebot

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

### Environment

#### SLACK_API_TOKEN

Set SLACK_API_TOKEN from the Bot integration settings on Slack.

```
heroku config:add SLACK_API_TOKEN=...
```

### Heroku Idling

Heroku free tier applications will idle. Use [UptimeRobot](http://uptimerobot.com) or similar to prevent your instance from sleeping or pay for a production dyno.
