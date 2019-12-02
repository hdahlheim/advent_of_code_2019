defmodule AdventOfCode2019.DayTwo do
  @add 1
  @multiply 2
  @halt 99

  def run_test_programm(memory) do
    state(memory)
    |> step_through()
  end

  def state(memory) do
    %{position: 0, memory: memory}
  end

  def brute_force(int_list) do
    noun = Enum.random(1..99)
    verb = Enum.random(1..99)

    result =
      state(int_list)
      |> restore_assist(noun, verb)
      |> step_through()
      |> Enum.at(0)

    case result do
      19_690_720 ->
        {19_690_720, noun, verb}

      _ ->
        brute_force(int_list)
    end
  end

  def restore_assist(state, noun \\ 12, verb \\ 2) do
    restored_ops =
      state.memory
      |> List.replace_at(1, noun)
      |> List.replace_at(2, verb)

    %{state | memory: restored_ops}
  end

  def step_through({:done, state}), do: state.memory

  def step_through(state) do
    new_state =
      case Enum.slice(state.memory, state.position, 4) do
        [@add, pos1, pos2, out] ->
          memory = run_instructions(state.memory, pos1, pos2, out, fn n1, n2 -> n1 + n2 end)
          %{state | position: state.position + 4, memory: memory}

        [@multiply, pos1, pos2, out] ->
          memory = run_instructions(state.memory, pos1, pos2, out, fn n1, n2 -> n1 * n2 end)
          %{state | position: state.position + 4, memory: memory}

        [@halt | _tail] ->
          {:done, state}
      end

    step_through(new_state)
  end

  defp run_instructions(memory, pos1, pos2, out, operation) do
    num1 = Enum.at(memory, pos1)
    num2 = Enum.at(memory, pos2)
    List.replace_at(memory, out, operation.(num1, num2))
  end
end
