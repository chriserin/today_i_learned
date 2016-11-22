defmodule VisitorVisitsPostShowPageTest do
  use TodayILearned.IntegrationCase

  test "with a post to display" do
    post = EctoFactory.insert(:post,
      title: "A post about porting Rails applications to Phoenix",
      body: "It starts with Rails and ends with Elixir",
    )

    other_post = EctoFactory.insert(:post,
      title: "A random post",
    )

    navigate_to("/")

    element = find_element(:class, "post__permalink")
    click(element)

    assert visible_in_page?(~r/A post about porting Rails applications to Phoenix/)
    assert visible_in_page?(~r/It starts with Rails and ends with Elixir/)
    assert visible_in_page?(~r/#{Timex.format!(post.inserted_at, "%B %-e, %Y", :strftime)}/)

    refute visible_in_page?(~r/A random post/)
  end
end
