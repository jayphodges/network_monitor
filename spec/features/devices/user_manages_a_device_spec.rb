require 'rails_helper'

feature "Device Management: " do
  scenario "User can add a device" do
    visit '/'

    mock_auth_hash

    click_link "Login with Github"

    visit "/devices"

    expect(page).to have_link('Add Device')

    click_link "Add device"

    expect(page).to have_content("Something")
  end
end
