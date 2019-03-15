defmodule ProjectName.Post do
  use Ecto.Schema
  import Ecto.Changeset


  schema "posts" do
    field :title, :string
    field :views, :integer

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :views])
    |> validate_required([:title, :views])
  end
end
