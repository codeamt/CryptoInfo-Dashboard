require "rails_helper"

feature "User lands on homepage" do
  scenario "successfully" do
    visit root_path
    expect(page).to have_headline_text
  end

  private

    def have_headline_text
      have_text ("Coin Compare")
    end
end