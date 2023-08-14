require 'rails_helper'

RSpec.describe "todos/show", type: :view do
  before(:each) do
    assign(:todo, Todo.create!(
      task: "Task",
      is_completed: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Task/)
    expect(rendered).to match(/false/)
  end
end
