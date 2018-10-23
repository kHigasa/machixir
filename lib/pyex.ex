defmodule Pyex do
  @moduledoc false
  def predict() do
    { :ok, py_exec } = :python.start( [
      {:python, 'python3'},
      {:python_path, 'lib'}, ] )
    :python.call( py_exec, :predict_sin, :predict, [] )
    :python.stop( py_exec )
  end
end
