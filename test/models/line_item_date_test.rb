require "test_helper"

class LineItemDateTest < ActiveSupport::TestCase
  test "#previous_date returns the quote's previous date when it exitsts" do
    assert_equal line_item_dates(:today), line_item_dates(:next_week).previous_date
  end

  test "#previous_date returns nil when the quote has no previous date" do
    assert_nil line_item_dates(:today).previous_date
  end

  test "Updating a line item date" do
    assert_selector "h1", text: "First quote"
  
    within id: dom_id(@line_item_date, :edit) do
      click_on "Edit"
    end
  
    assert_selector "h1", text: "First quote"
  
    fill_in "Date", with: Date.current + 1.day
    click_on "Update date"
  
    assert_text I18n.l(Date.current + 1.day, format: :long)
  end
  
  test "Destroying a line item date" do
    assert_text I18n.l(Date.current, format: :long)
  
    accept_confirm do
      within id: dom_id(@line_item_date, :edit) do
        click_on "Delete"
      end
    end
  
    assert_no_text I18n.l(Date.current, format: :long)
  end
end
