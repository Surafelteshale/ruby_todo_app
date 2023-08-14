require 'rails_helper'

RSpec.describe "todos/new", type: :view do
  before(:each) do
    assign(:todo, Todo.new(
      task: "MyString",
      is_completed: false
    ))
  end

  it "renders new todo form" do
    render

    assert_select "form[action=?][method=?]", todos_path, "post" do

      assert_select "input[name=?]", "todo[task]"

      assert_select "input[name=?]", "todo[is_completed]"
    end
  end
end
