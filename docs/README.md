# SlackEmoji

## What is this?
- This downloads slack emoji.

## Requirement
- [Elixir](https://elixir-lang.org/)

## Build

```
$ mix deps.get
$ mix escript.build
```

## Usage

```
$ ./slack_emoji --token xoxp-******
```

## Get token

```
https://api.slack.com/
|> Your Apps
|> Create New App
|> Select created app
|> Add features and functionality
|> Permissions
|> Scopes
|> Select emoji:read
|> Save Changes
|> Install App
|> Copy OAuth Access Token
```
