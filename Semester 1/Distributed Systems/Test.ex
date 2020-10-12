defmodule Hello do
  def start_link() do
    Task.start_link(fn -> loop() end)
  end

  defp loop() do
    receive do
      "Well hello there" ->
        IO.puts("General Kenobi")
        loop()
      _ ->
        IO.puts("Rebel scum!")
        loop()
    end
  end
end

