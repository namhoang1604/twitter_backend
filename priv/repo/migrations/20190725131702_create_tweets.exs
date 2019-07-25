defmodule TwitterServer.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :content, :string
      add :retweets, :integer

      timestamps()
    end

  end
end
