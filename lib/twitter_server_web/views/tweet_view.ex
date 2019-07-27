defmodule TwitterServerWeb.TweetView do
  use TwitterServerWeb, :view
  alias TwitterServerWeb.TweetView

  def render("index.json", %{tweets: tweets, total: total}) do
    %{data: render_many(tweets, TweetView, "tweet.json"), total: total}
  end

  def render("show.json", %{tweet: tweet}) do
    %{data: render_one(tweet, TweetView, "tweet.json")}
  end

  def render("tweet.json", %{tweet: tweet}) do
    %{
      id: tweet.id,
      content: tweet.content,
      retweets: tweet.retweets,
      owner_id: tweet.owner_id,
      owner_name: tweet.owner_name,
      inserted_at: tweet.inserted_at
    }
  end
end
