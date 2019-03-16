defmodule ProjectNameWeb.PostsController do
  use ProjectNameWeb, :controller

  def index(conn, _params) do
    post = ProjectName.Post.changeset(%ProjectName.Post{}, %{title: "タイトル", views: 1})
    render conn, "index.html", foo: "bar2", post: post
  end

  def create(conn, %{"post" => %{ "title" => title} }) do
    post = %ProjectName.Post{title: title, views: 1}
    IO.puts post.title
    ProjectName.Repo.insert!(post)

    redirect(conn, to: "/posts")
  end
end
