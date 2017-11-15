require 'rails_helper'

RSpec.describe Currency, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:currency_type) }
  it 'should throw error for invalid value of currency_type' do
    expect { build(:currency, currency_type: "invalid") }.to raise_error(ArgumentError).with_message(/is not a valid currency_type/)
  end
end
