require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :event => nil,
      :user => nil,
      :stars => 1,
      :comment => "MyString"
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "input#review_event_id[name=?]", "review[event_id]"

      assert_select "input#review_user_id[name=?]", "review[user_id]"

      assert_select "input#review_stars[name=?]", "review[stars]"

      assert_select "input#review_comment[name=?]", "review[comment]"
    end
  end
end
