defmodule DemoWeb.TableLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div phx-keyup="press" phx-target="window">
      <a phx-click="count" phx-value="counter1" >Counter 1</a> | 
      <a phx-click="count" phx-value="counter2" >Counter 2</a>
      <hr/>
      <form phx-submit="submit" phx-change="suggest">
        <input 
          type="text" 
          name="q" 
          placeholder="Search..." 
          phx-focus="focus"
          phx-blur="blur"
        />
      </form>


      <table style="transform: rotate(0deg); <%= hide @focus %>" >
        <tr>
          <th>Name</th>
          <th>Value</th>
        </tr>
        <tr>
          <td>Socket.assigns.hello</td>
          <td><%= @hello %></td>
        </tr>
        <tr>
          <td>Ticker</td>
          <td><%= @clock %></td>
        </tr>
        <tr>
          <td>Counter1</td>
          <td><%= @counter1 %></td>
        </tr>
        <tr>
          <td>Counter2</td>
          <td><%= @counter2 %></td>
        </tr>
        <tr>
          <td>Search Field type</td>
          <td><%= @typed %></td>
        </tr>
        <tr>
          <td>Search Field submit</td>
          <td><%= @search %></td>
        </tr>
        <tr>
          <td>Search Field focus</td>
          <td><%= @focus %></td>
        </tr>
      </table>
    </div>
    """
  end
  
  def inc(socket, field) do
    update(socket, field, &(&1 + 1))
  end
  
  def press(socket, "1") do
    inc(socket, :counter1)
  end
  def press(socket, "2") do
    inc(socket, :counter2)
  end
  def press(socket, _other) do
    socket
  end
  
  def hide(true), do: "display: none;"
  def hide(false), do: ""
  
  def search(socket, term) do
    IO.inspect term
    socket
    |> assign(:search, "You searched for #{term}")
  end

  
  def mount(_session, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), :tick)
    
    {
      :ok, 
      socket
      |>assign(:hello, :world)
      |>assign(:clock, 0)
      |>assign(:counter1, 0)
      |>assign(:counter2, 0)
      |>assign(:typed, "--")
      |>assign(:search, "--")
      |>assign(:focus, false)
    }
  end
  
  def handle_info(:tick, socket) do
    {:noreply, inc(socket, :clock)}
  end
  
  def handle_event("count", field, socket) do
    {:noreply, inc(socket, String.to_atom field)}
  end

  def handle_event("press", character, socket) do
    {:noreply, press( socket, character )}
  end

  def handle_event("suggest", %{"q" => q}, socket) do
    {:noreply, assign(socket, :typed, q)}
  end

  def handle_event("submit", %{"q" => q}, socket) do
    {:noreply, search(socket, q)}
  end
  
  def handle_event("focus", _, socket) do
    {:noreply, assign(socket, :focus, true)}
  end

  def handle_event("blur", _, socket) do
    {:noreply, assign(socket, :focus, false)}
  end

end
