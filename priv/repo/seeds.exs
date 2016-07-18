# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TokyoexHandsonMy.Repo.insert!(%TokyoexHandsonMy.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

[
  %TokyoexHandsonMy.Article{
    url: "http://elixir-lang.org",
    title: "elixir official site",
    og_title: "elixir official site",
    og_image: "http://elixir-lang.org/images/logo/logo.png",
    og_description: "Elixir is a dynamic, functional language designed for building scalable and maintainable applications. Elixir leverages the Erlang VM, known for running low-latency, distributed and fault-tolerant systems, while also being successfully used in web development and the embedded software domain."
  },
  %TokyoexHandsonMy.Article{
    url: "http://www.phoenixframework.org",
    title: "Phoenix Framework",
    og_title: "Phoenix Framework",
    og_image: nil,
    og_description: "A productive web framework that does not compromise speed and maintainability."
  },
  %TokyoexHandsonMy.Article{
    url: "https://common-lisp.net",
    title: "common lisp net",
    og_title: "common lisp net",
    og_image: "https://common-lisp.net/static/imgs/lisplogo.png",
    og_description: "Welcome to the amazing world of Common Lisp, the programmable programming language. This site is one among many gateways to Common Lisp. Its goal is to provide the Common Lisp community with development resources and to work as a starting point for new programmers."
  }
] |> Enum.each(fn data -> TokyoexHandsonMy.Repo.insert!(data) end)
