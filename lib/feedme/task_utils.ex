defmodule Feedme.TaskUtils do
  def wait_task_and_catch(task) do
    # try/catch so that if a feed fetch fails, it does not take down the whole process
    try do
      Task.await(task)
    catch
      error, _ ->
        IO.puts("Task failed, timeout?")
        IO.inspect(error)
        []
    end
  end
end
