defmodule DayOneTest do
  use ExUnit.Case
  doctest Dayone

  test "calculate the fuel" do
    assert Dayone.fuel(12) == 2
    assert Dayone.fuel(14) == 2
    assert Dayone.fuel(1969) == 654
  end

  test "total" do
    assert Dayone.total_fuel([12, 14, 1969]) == 658
  end

  test "input day one" do
    []
    |> Dayone.total_fuel()
    |> IO.puts()
  end

  test "part two example test" do
    assert Dayone.fuel_for_fuel(14) == 2
    assert Dayone.fuel_for_fuel(1969) == 966
  end

  test "input part two" do
    input = []

    Enum.map(input, &Dayone.fuel_for_fuel/1)
    |> Enum.sum()
    |> IO.puts()
  end
end
