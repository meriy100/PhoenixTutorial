defmodule ProjectNameWeb.PostsController do
  use ProjectNameWeb, :controller

  def index(conn, _params) do
    post = %ProjectName.Post{title: "タイトル", views: 1}
    IO.puts post.title
    # ProjectName.Repo.insert!(post)
    post = ProjectName.Repo.get ProjectName.Post, 1

    render conn, "index.html", foo: "bar2", post: post
  end
end
