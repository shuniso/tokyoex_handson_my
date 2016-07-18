defmodule TokyoexHandsonMy.Crawler.Engine do
    require Logger

    def get_site(url) do
        Logger.debug "### Get #{url} ###"
        %{body: body} = HTTPoison.get!(url)
        body
    end

    def crawl(url, 0, _) do
        Logger.debug "### Crawl #{url} ###"
        if TokyoexHandsonMy.Crawler.Storage.has_page?(url) do
            Logger.debug "### already put #{url} ###"
        else
            Task.async(fn ->
                site = get_site(url)
                |> TokyoexHandsonMy.Crawler.Parser.parse_html
                TokyoexHandsonMy.Crawler.Storage.put_page(url, site)
            end)
        end
    end

    def crawl(url, depth, pattern) do
        Logger.debug "### Crawling #{url} , depth=#{inspect depth} ###"
        body = get_site(url)
        site = body |> TokyoexHandsonMy.Crawler.Parser.parse_html

        TokyoexHandsonMy.Crawler.Storage.put_page(url, site)

        TokyoexHandsonMy.Crawler.Parser.parse_link(body, pattern)
        |> Enum.map(fn url ->
            crawl(url, (depth - 1), pattern)
        end)
        |> Enum.reject(&(&1 == :ok))
        |> Enum.each(&Task.await(&1, 10_000))
    end

end
