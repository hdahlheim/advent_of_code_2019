defmodule DayOne do
  def fuel(mass) do
    div(mass, 3) - 2
  end

  def total_fuel(list) do
    Enum.reduce(list, 0, fn mass, acc ->
      acc + fuel(mass)
    end)
  end

  def fuel_for_fuel(mass, fuel \\ 0)

  def fuel_for_fuel(mass, fuel) do
    fuel_needed = fuel(mass)

    if fuel_needed <= 0 do
      fuel
    else
      fuel_for_fuel(fuel_needed, fuel + fuel_needed)
    end
  end
end
