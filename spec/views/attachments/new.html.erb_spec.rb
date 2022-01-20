require 'rails_helper'

RSpec.describe "attachments/new", type: :view do
  before(:each) do
    assign(:attachment, Attachment.new(
      name: "MyString",
      image: "MyString"
    ))
  end

  it "renders new attachment form" do
    render

    assert_select "form[action=?][method=?]", attachments_path, "post" do

      assert_select "input[name=?]", "attachment[name]"

      assert_select "input[name=?]", "attachment[image]"
    end
  end
end
