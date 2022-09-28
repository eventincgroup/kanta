defmodule Kanta.POFiles.ExtractorAgent do
  use GenServer
  alias Kanta.POFiles.Extractor

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def get_translations do
    GenServer.call(__MODULE__, {:get_translations})
  end

  @impl true
  def init(_) do
    {:ok,
     %{
       translations: Extractor.get_translations()
     }}
  end

  @impl true
  def handle_call({:get_translations}, _from, state) do
    {:reply, state.translations, state}
  end
end
