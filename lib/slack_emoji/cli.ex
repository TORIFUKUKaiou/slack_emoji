defmodule SlackEmoji.CLI do
  def main(args) do
    args
    |> parse_args
    |> process
  end

  defp parse_args(args) do
    parse = OptionParser.parse(args, switches: [token: :string])

    case parse do
      {[token: token], _, _} -> token
      {_, _, _} -> :help
    end
  end

  def process(:help) do
    IO.puts("""
    usage: slack_emoji --token xoxp-******
    """)

    System.halt(0)
  end

  def process(token) do
    token |> SlackEmoji.EmojiList.download()
  end
end
