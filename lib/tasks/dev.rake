#if Rails.env.development? || Rails.env.test?
  require "factory_bot"
  require "currencies/currency_client"



  namespace :dev do
    desc "Insert all cryptocoins in the db"
    task seed: "db:seed" do
      include CurrencyClient

      begin
        bitcoins = CurrencyClient.get_bitcoins
        ethereums = CurrencyClient.get_ethereums
        nasdaqs = CurrencyClient.get_nasdaqs
        bitcoin_cashes = CurrencyClient.get_bitcoin_cashes
        litecoins = CurrencyClient.get_litecoins
        zcashes = CurrencyClient.get_zcashes
        moneros = CurrencyClient.get_moneros


        insert_currencies('bitcoin', bitcoins)
        insert_currencies('ethereum', ethereums)
        insert_currencies('nasdaq', nasdaqs)
        insert_currencies('bitcoin_cash', bitcoin_cashes)
        insert_currencies('litecoin', litecoins)
        insert_currencies('zcash', zcashes)
        insert_currencies('monero', moneros)

        puts "Yes! We've got the coin valies in the db now."

      rescue ActiveRecord::StatementInvalid

      end
    end
  end

  def insert_currencies(type, currencies)
    currencies.each do |date, value|
      ActiveRecord::Base.transaction do
        Currency.create(currency_type: type, date: date, value: value)
        print_currency(type.capitalize, date, value)
      end
    end
  end

  def print_currency(currency, date, value)
    puts "#{currency}'s value on #{date}: #{value} USD"
  end

#namespace :dev do
    #desc "Sample data for local development environment"
    #task prime: "db:setup" do
      #include FactoryBot::Syntax::Methods

      # create(:user, email: "user@example.com", password: "password")
    #end
  #end
#end