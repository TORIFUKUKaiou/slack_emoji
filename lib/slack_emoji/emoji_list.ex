defmodule SlackEmoji.EmojiList do
  def download(token) do
    "https://slack.com/api/emoji.list?token=#{token}"
    |> HTTPoison.get()
    |> decode_response
    |> Poison.decode!()
    |> decode_emojis
    |> Flow.from_enumerable()
    |> Flow.reject(fn {_, url} -> String.starts_with?(url, "alias") end)
    |> Flow.partition()
    |> Flow.each(fn {key, url} ->
      File.mkdir_p("images/")

      body =
        url
        |> HTTPoison.get()
        |> decode_response

      ("images/" <> key <> "." <> extension(url))
      |> File.write(body)
    end)
    |> Enum.to_list()
  end

  def decode_response({:ok, %{body: body}}), do: body

  def decode_response(res) do
    IO.inspect(res)
    System.halt(1)
  end

  def decode_emojis(%{"emoji" => emojis}), do: emojis

  def decode_emojis(h) do
    IO.inspect(h)
    System.halt(2)
  end

  def extension(url), do: url |> String.split(".") |> Enum.at(-1)
end
