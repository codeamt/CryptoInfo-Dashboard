require "rails_helper"

describe CurrenciesController, type: controller do
  it "should display the bitcoin charts" do
    should_display_charts("bitcoin")
  end

  it "should display the ethereum charts" do
    should_display_charts("ethereum")
  end


  it "should display the nasdaq charts" do
    should_display_charts("nasdaq")
  end

  it "should display the bitcoin_cash charts" do
    should_display_charts("bitcoin_cash")
  end

  it "should display the litecoin charts" do
    should_display_charts("litecoin")
  end

  it "should display the zcash charts" do
    should_display_charts("zcash")
  end

  it "should display the monero charts" do
    should_display_charts("monero")
  end

  private

    def should_display_charts(currency)
      get :show, params: { id: currency }
      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
      expect(response).to be_success
    end
end