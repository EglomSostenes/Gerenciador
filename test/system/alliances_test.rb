require "application_system_test_case"

class AlliancesTest < ApplicationSystemTestCase
  setup do
    @alliance = alliances(:one)
  end

  test "visiting the index" do
    visit alliances_url
    assert_selector "h1", text: "Alliances"
  end

  test "creating a Alliance" do
    visit alliances_url
    click_on "New Alliance"

    fill_in "Company", with: @alliance.company_id
    fill_in "End date", with: @alliance.end_date
    fill_in "Institution", with: @alliance.institution_id
    fill_in "Start date", with: @alliance.start_date
    click_on "Create Alliance"

    assert_text "Alliance was successfully created"
    click_on "Back"
  end

  test "updating a Alliance" do
    visit alliances_url
    click_on "Edit", match: :first

    fill_in "Company", with: @alliance.company_id
    fill_in "End date", with: @alliance.end_date
    fill_in "Institution", with: @alliance.institution_id
    fill_in "Start date", with: @alliance.start_date
    click_on "Update Alliance"

    assert_text "Alliance was successfully updated"
    click_on "Back"
  end

  test "destroying a Alliance" do
    visit alliances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Alliance was successfully destroyed"
  end
end
