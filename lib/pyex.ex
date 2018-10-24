defmodule Pyex do
  @moduledoc false
  def mnist() do
    { :ok, py_exec } = :python.start( [
      {:python, 'python3'},
      {:python_path, 'lib'}, ] )
    :python.call( py_exec, :mnist, :out, [] )
    :python.stop( py_exec )
  end
end
