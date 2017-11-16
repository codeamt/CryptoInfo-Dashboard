require "rails_helper"

feature "User views chart links"  do
  scenario "successfully" do
    visit root_path
    expect(page).to have_link("Bitcoin")
    expect(page).to have_link("Ethereum")
    expect(page).to have_link("Nasdaq")
    expect(page).to have_link("Bitcoin Cash")
    expect(page).to have_link("Litecoin")
    expect(page).to have_link("ZCash")
    expect(page).to have_link("Monero")
  end
end

feature "User views Wikipedia links of" do

  scenario "Bitcoin" do
    expect_page_to_have_link("Bitcoin")
  end

  scenario "Ethereum" do
   expect_page_to_have_link("Ethereum")
  end

  scenario "Nasdaq" do
    expect_page_to_have_link("Nasdaq")
  end

  scenario "Bitcoin Cash" do
    expect_page_to_have_link("Bitcoin Cash")
  end

  scenario "Litecoin" do
    expect_page_to_have_link("Litecoin")
  end

  scenario "Zcash" do
    expect_page_to_have_link("ZCash")
  end

  scenario "Monero" do
    expect_page_to_have_link("Monero")
  end
end

  private

    def expect_page_to_have_link(currency)
      visit currency_path("#{currency}")
      expect(page).to have_link("#{currency}", :href => "https://en.wikipedia.org/wiki/#{currency}")
    end
