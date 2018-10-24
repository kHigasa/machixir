defmodule Pyex do
  @moduledoc false
  def smoke() do
    { :ok, py_exec } = :python.start( [
      {:python, 'python3'},
      {:python_path, 'lib'}, ] )
    :python.call( py_exec, :mnist, :smoke, [] )
    :python.stop( py_exec )
  end
end
