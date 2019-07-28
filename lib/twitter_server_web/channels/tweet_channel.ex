defmodule TwitterServerWeb.TweetChannel do
  use Phoenix.Channel
  alias TwitterServer.Twitter

  def join("tweets:" <> tweet_id, _params, socket) do
    tweet = Twitter.get_tweet!(String.to_integer(tweet_id))

    if !is_nil(tweet) do
      {:ok, socket}
    else
      {:error, "Not Found"}
    end
  end
end
