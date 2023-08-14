require 'rails_helper'

RSpec.describe "todos/edit", type: :view do
  let(:todo) {
    Todo.create!(
      task: "MyString",
      is_completed: false
    )
  }

  before(:each) do
    assign(:todo, todo)
  end

  it "renders the edit todo form" do
    render

    assert_select "form[action=?][method=?]", todo_path(todo), "post" do

      assert_select "input[name=?]", "todo[task]"

      assert_select "input[name=?]", "todo[is_completed]"
    end
  end
end
