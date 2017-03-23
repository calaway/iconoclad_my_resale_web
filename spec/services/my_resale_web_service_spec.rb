require 'rails_helper'

RSpec.describe MyResaleWebService, type: :service do
  it "fetches the consignor's balance" do
    expect(MyResaleWebService.fetch_balance(ENV["MY_RESALE_WEB_ID_1"], ENV["MY_RESALE_WEB_NAME_1"])).to eq "$33.411"
  end
end
