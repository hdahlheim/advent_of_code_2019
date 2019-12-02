defmodule AdventOfCode2019.DayOneTest do
  use ExUnit.Case
  alias AdventOfCode2019.DayOne
  doctest DayOne

  test "calculate the fuel" do
    assert DayOne.fuel(12) == 2
    assert DayOne.fuel(14) == 2
    assert DayOne.fuel(1969) == 654
  end

  test "total" do
    assert DayOne.total_fuel([12, 14, 1969]) == 658
  end

  test "input day one" do
    []
    |> DayOne.total_fuel()
    |> IO.puts()
  end

  test "part two example test" do
    assert DayOne.fuel_for_fuel(14) == 2
    assert DayOne.fuel_for_fuel(1969) == 966
  end

  test "input part two" do
    input = []

    Enum.map(input, &Dayone.fuel_for_fuel/1)
    |> Enum.sum()
    |> IO.puts()
  end
end
