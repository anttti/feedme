defmodule TaskTest do
  defp job() do
    Process.sleep(2000)
    IO.puts("returning")
    1
  end

  def start() do
    IO.puts("starting")
    task = Task.async(&job/0)
    IO.puts("running")
    result = Task.await(task)
    IO.puts("stopping")
    IO.inspect(result)
  end
end

TaskTest.start()
