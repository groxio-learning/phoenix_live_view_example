defmodule DemoWeb.TableLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <a>Counter 1</a> | <a>Counter 2</a>
    <hr/>
    <form>
      <input type="text" name="q" placeholder="Search..." />
    </form>

    <%= table(assigns) %>
    """
  end
  
  def table(assigns) do
    ~L"""
    <table>
      <tr>
        <th>Name</th>
        <th>Value</th>
      </tr>
      <tr>
        <td>Socket.assigns.hello</td>
        <td><%= @hello %></td>
      </tr>
      <tr>
        <td>System Counter</td>
        <td>?</td>
      </tr>
      <tr>
        <td>Counter1</td>
        <td>?</td>
      </tr>
      <tr>
        <td>Counter2</td>
        <td>?</td>
      </tr>
      <tr>
        <td>Search Field type</td>
        <td>?</td>
      </tr>
      <tr>
        <td>Search Field submit</td>
        <td>?</td>
      </tr>
      <tr>
        <td>Search Field focus</td>
        <td>?</td>
      </tr>
      <tr>
        <td>Search Field blur</td>
        <td>?</td>
      </tr>
    </table>
    """
  end

  def mount(_session, socket) do
    {:ok, assign(socket, :hello, :world)}
  end
end
