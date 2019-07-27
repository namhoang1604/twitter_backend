defmodule TwitterServer.Twitter.Tweet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tweets" do
    field :content, :string
    field :retweets, {:array, :string}, default: []
    field :owner_id, :string
    field :owner_name, :string

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:content, :retweets, :owner_id, :owner_name])
    |> validate_required([:content, :retweets, :owner_id, :owner_name])
    |> validate_length(:content,
      max: 140,
      message: "Tweet content is too long. Maximum 140 characters."
    )
  end
end
