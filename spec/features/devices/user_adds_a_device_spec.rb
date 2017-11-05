require 'rails_helper'

feature "as a logged in user" do
  scenario "I can add a device" do
    user   = create(:user)

    user1.orders.each do |order|
      order.items << create_list(:item, 3)
    end

    user2   = create(:user_with_orders)

    user2.orders.each do |order|
      order.items << create_list(:item, 3)
    end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit "/orders"

    expect(page).to_not have_link(user2.orders.first.id)

    visit "/orders/#{user2.orders.first.id}"

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
