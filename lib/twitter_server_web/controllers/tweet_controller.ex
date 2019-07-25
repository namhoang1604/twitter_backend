defmodule TwitterServerWeb.TweetController do
  use TwitterServerWeb, :controller

  alias TwitterServer.Twitter
  alias TwitterServer.Twitter.Tweet

  action_fallback TwitterServerWeb.FallbackController

  @default_limit 25

  def index(conn, params) do
    limit = get_limit(params["limit"])
    page = get_page(params["page"])
    tweets = Twitter.list_tweets(limit, page)

    total = Twitter.get_total()

    render(conn, "index.json", %{tweets: tweets, total: total})
  end

  def create(conn, %{"tweet" => tweet_params}) do
    with {:ok, %Tweet{} = tweet} <- Twitter.create_tweet(tweet_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.tweet_path(conn, :show, tweet))
      |> render("show.json", tweet: tweet)
    end
  end

  def show(conn, %{"id" => id}) do
    tweet = Twitter.get_tweet!(id)
    render(conn, "show.json", tweet: tweet)
  end

  def update(conn, %{"id" => id, "tweet" => tweet_params}) do
    tweet = Twitter.get_tweet!(id)

    with {:ok, %Tweet{} = tweet} <- Twitter.update_tweet(tweet, tweet_params) do
      render(conn, "show.json", tweet: tweet)
    end
  end

  def delete(conn, %{"id" => id}) do
    tweet = Twitter.get_tweet!(id)

    with {:ok, %Tweet{}} <- Twitter.delete_tweet(tweet) do
      send_resp(conn, :no_content, "")
    end
  end

  defp get_limit(limit) when limit in [nil, ""], do: @default_limit

  defp get_limit(limit),
    do: if(String.to_integer(limit) < 1, do: @default_limit, else: String.to_integer(limit))

  defp get_page(page) when page in [nil, ""], do: 0
  defp get_page(page), do: if(String.to_integer(page) < 0, do: 0, else: String.to_integer(page))
end
