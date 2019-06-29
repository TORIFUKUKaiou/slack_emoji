defmodule SlackEmojiTest do
  use ExUnit.Case
  doctest SlackEmoji

  test "greets the world" do
    assert SlackEmoji.hello() == :world
  end
end
