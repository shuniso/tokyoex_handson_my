defmodule TokyoexHandsonMy.Crawler.Storage do
    require Logger

    def start_link do
        Agent.start_link(fn -> Map.new end, name: __MODULE__)
    end

    def has_page?(url) do
        Agent.get __MODULE__, fn map ->
            Map.has_key?(map, url)
        end
    end

    def put_page(url, pages) do
        Logger.debug "--- Put #{url} ---"
        Agent.update __MODULE__, fn map ->
            Map.put(map, url, pages)
        end
    end

    def clear_all do
        Logger.debug "--- Clear All ---"
        Agent.update __MODULE__, fn _map ->
            Map.new
        end
    end

    def keys do
        Logger.debug "--- Show Keys ---"
        Agent.get __MODULE__, fn map ->
            Map.keys(map)
        end
    end

    def dump do
        Logger.debug "-- Dump All ---"
        Agent.get __MODULE__, fn map ->
            map
        end
    end

    def store_to_db do
        Logger.debug "--- Save storage toDB ---"
        dump
        |> Enum.each(fn {url, data} ->
            store_article_to_db(url, data)
        end)
    end

    def store_article_to_db(url, data) do
        try do
            if TokyoexHandsonMy.Article.exist_with_url(url) do
                Logger.debug "#{url} is already inserted!"
            else
                TokyoexHandsonMy.Repo.insert!(%TokyoexHandsonMy.Article{
                    url: url,
                    title: data |> Map.get(:title),
                    og_title: data |> Map.get(:og_title),
                    og_description: data |> Map.get(:og_description),
                    og_image: data |> Map.get(:og_image)
                })
                Logger.debug "#{url} is inserted!"
            end
        rescue
            _ -> Logger.debug "#{url} is recued!"
        end
    end
end
