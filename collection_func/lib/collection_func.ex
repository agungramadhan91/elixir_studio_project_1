defmodule CollectionFunc do
  @moduledoc """
  Documentation for `CollectionFunc`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> CollectionFunc.hello()
      :world

  """
  def index do
	Utils.Db_Products.all()
  end
  
  def hello do
    :world
  end
end
