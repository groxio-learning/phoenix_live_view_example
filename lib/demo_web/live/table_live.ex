defmodule DemoWeb.TableLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div>
      <a>Counter 1</a> | 
      <a>Counter 2</a>
      <hr/>
      <form>
        <input 
          type="text" 
          name="q" 
          placeholder="Search..." 
        />
      </form>


      <table>
        <tr>
          <th>Name</th>
          <th>Value</th>
        </tr>
        <tr>
          <td>Socket.assigns.hello</td>
          <td>?</td>
        </tr>
        <tr>
          <td>Ticker</td>
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
        <tr>
          <td>Key up</td>
          <td>?</td>
        </tr>
        <tr>
          <td>Key down</td>
          <td>?</td>
        </tr>
      </table>
    </div>
    """
  end
  
  def mount(_session, socket) do
    {
      :ok, 
      socket
    }
  end
end
