defmodule TokyoexHandsonMy.ListController do
    use TokyoexHandsonMy.Web, :controller
    require Logger

    def index(conn, _params) do
        Logger.info("/list accessed!")
        Logger.debug("/list accessed!")

        my_list = TokyoexHandsonMy.Repo.all(TokyoexHandsonMy.Article)
        render conn, "index.html", list: my_list
    end
end
