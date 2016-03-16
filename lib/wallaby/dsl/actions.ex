defmodule Wallaby.DSL.Actions do
  alias Wallaby.Session
  import Wallaby.DSL.Finders, only: [find: 2]
  import Wallaby.XPath

  def fill_in(session, query, with: value) when is_binary(value) do
    node = find(session, {:xpath, fillable_field(query)})
    Session.request(
      :post,
      "#{session.base_url}session/#{session.id}/element/#{node.id}/value",
      %{value: [value]}
    )
  end
end