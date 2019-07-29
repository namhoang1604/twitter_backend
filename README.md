# Twitter Server

This project likes a basic version of Twitter.

## Features

- Create a tweet from the anonymous user.
- Show list tweets with sort by the number of retweets and default limit is 10 tweets.
- Implement infinity scroll to get more tweets.
- The user can retweet/unretweet every tweets.
- Update real-time the number of retweets when another user retweet the tweet.

## Install

### Prerequisites

- Elixir 1.5 or later.
- Erlang 18 or later.
- PostgreSQL

### Phoenix

Here’s the command to install the Phoenix archive:

```console
$ mix archive.install hex phx_new 1.4.0
```

## Start Server

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
