defmodule TwitterServer.TwitterTest do
  use TwitterServer.DataCase

  alias TwitterServer.Twitter

  describe "tweets" do
    alias TwitterServer.Twitter.Tweet

    @valid_attrs %{content: "some content", retweets: 42}
    @update_attrs %{content: "some updated content", retweets: 43}
    @invalid_attrs %{content: nil, retweets: nil}

    def tweet_fixture(attrs \\ %{}) do
      {:ok, tweet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Twitter.create_tweet()

      tweet
    end

    test "list_tweets/0 returns all tweets" do
      tweet = tweet_fixture()
      assert Twitter.list_tweets() == [tweet]
    end

    test "get_tweet!/1 returns the tweet with given id" do
      tweet = tweet_fixture()
      assert Twitter.get_tweet!(tweet.id) == tweet
    end

    test "create_tweet/1 with valid data creates a tweet" do
      assert {:ok, %Tweet{} = tweet} = Twitter.create_tweet(@valid_attrs)
      assert tweet.content == "some content"
      assert tweet.retweets == 42
    end

    test "create_tweet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Twitter.create_tweet(@invalid_attrs)
    end

    test "update_tweet/2 with valid data updates the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{} = tweet} = Twitter.update_tweet(tweet, @update_attrs)
      assert tweet.content == "some updated content"
      assert tweet.retweets == 43
    end

    test "update_tweet/2 with invalid data returns error changeset" do
      tweet = tweet_fixture()
      assert {:error, %Ecto.Changeset{}} = Twitter.update_tweet(tweet, @invalid_attrs)
      assert tweet == Twitter.get_tweet!(tweet.id)
    end

    test "delete_tweet/1 deletes the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{}} = Twitter.delete_tweet(tweet)
      assert_raise Ecto.NoResultsError, fn -> Twitter.get_tweet!(tweet.id) end
    end

    test "change_tweet/1 returns a tweet changeset" do
      tweet = tweet_fixture()
      assert %Ecto.Changeset{} = Twitter.change_tweet(tweet)
    end
  end
end
