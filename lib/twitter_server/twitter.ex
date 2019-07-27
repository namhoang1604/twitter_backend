defmodule TwitterServer.Twitter do
  @moduledoc """
  The Twitter context.
  """

  import Ecto.Query, warn: false
  alias TwitterServer.Repo

  alias TwitterServer.Twitter.Tweet

  @doc """
  Returns the list of tweets.

  """
  def list_tweets(limit, page) do
    Tweet
    |> select([t], t)
    |> add_limit_offset(limit, page)
    |> Repo.all()
  end

  @doc """
  Gets a single tweet.

  """
  def get_tweet!(id), do: Repo.get!(Tweet, id)

  @doc """
  Creates a tweet.

  """
  def create_tweet(attrs \\ %{}) do
    %Tweet{}
    |> Tweet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tweet.

  """
  def update_tweet(%Tweet{} = tweet, attrs) do
    tweet
    |> Tweet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tweet.

  """
  def delete_tweet(%Tweet{} = tweet) do
    Repo.delete(tweet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tweet changes.

  """
  def change_tweet(%Tweet{} = tweet) do
    Tweet.changeset(tweet, %{})
  end

  @doc """
  Get total of tweets
  """
  def get_total() do
    Tweet
    |> select([t], count(t.id))
    |> Repo.one()
  end

  defp add_limit_offset(query, limit, page) do
    query
    |> order_by([t], desc: t.retweets)
    |> limit(^limit)
    |> offset(^(page * limit))
  end
end
