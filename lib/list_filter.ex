defmodule ListFilter do
  def call(list) do
    list
    |> Enum.flat_map(fn x -> map_integer(x) end)
    |> Enum.filter(fn x -> odd?(x) end)
    |> Enum.count()
  end

  defp map_integer(string) when is_binary(string) do
    case Integer.parse(string) do
      {int, _rest} -> [int]
      :error -> []
    end
  end

  defp map_integer(number) when is_integer(number), do: [number]

  defp map_integer(_other), do: []

  defp odd?(number), do: rem(number, 2) != 0
end
