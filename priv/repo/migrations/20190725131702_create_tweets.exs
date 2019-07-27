defmodule TwitterServer.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :content, :string
      add :retweets, {:array, :string}, default: []
      add :owner_id, :string
      add :owner_name, :string

      timestamps()
    end
  end
end
