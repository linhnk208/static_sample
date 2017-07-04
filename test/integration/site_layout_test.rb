require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", '/'
    assert_select "a[href=?]", 'help'
    assert_select "a[href=?]", 'about'
    assert_select "a[href=?]", 'contact'
    assert_select "a[href=?]", signup_path

    get contact_path
    assert_select "title", full_title("Contact")

    get signup_path
    assert_select "title", full_title("Sign up")
  end
end