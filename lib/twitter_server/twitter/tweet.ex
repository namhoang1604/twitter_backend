defmodule TwitterServer.Twitter.Tweet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tweets" do
    field :content, :string
    field :retweets, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:content], [:retweets])
    |> validate_required([:content, :retweets])
    |> validate_length(:content,
      max: 140,
      message: "Tweet content is too long. Maximum 140 characters."
    )
  end
end
