defmodule AdventOfCode2019.DayTwoTest do
  use ExUnit.Case
  alias AdventOfCode2019.DayTwo
  doctest DayTwo

  @int_list []

  @tag :day_two
  test "test programm" do
    assert DayTwo.run_test_programm([1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50]) ==
             [3500, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50]

    assert DayTwo.run_test_programm([1, 0, 0, 0, 99]) == [2, 0, 0, 0, 99]

    assert DayTwo.run_test_programm([2, 3, 0, 3, 99]) == [2, 3, 0, 6, 99]
  end

  @tag :day_two
  test "run part1 with input" do
    DayTwo.state(@int_list)
    |> DayTwo.restore_assist()
    |> DayTwo.step_through()
    |> Enum.at(0)
    |> IO.puts()
  end

  @tag :day_two
  test "run part2 with input" do
    assert {19_690_720, noun, verb} = DayTwo.brute_force(@int_list)

    IO.puts(100 * noun + verb)
  end
end
