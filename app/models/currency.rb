class Currency < ApplicationRecord
  validates :date, presence: true
  validates :currency_type, presence: true

  enum currency_type: [:bitcoin, :ethereum, :nasdaq, :bitcoin_cash, :litecoin, :zcash, :monero]
end
