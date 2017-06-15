require 'rails_helper'

RSpec.describe MyResaleWebService, type: :service do
  it "fetches the balance screen data" do
    id   = ENV["MY_RESALE_WEB_ID_1"]
    name = ENV["MY_RESALE_WEB_NAME_1"]
    balance_page_content = MyResaleWebService.balance_page_content(id, name)

    # Expect balance to be of the format "$1234.56"
    expect(balance_page_content["Balance"]).to match(/\A\$\d+\.\d{2}\z/)
    expect(balance_page_content["Name"]).to eq("Jodi Mardesich-Smith")
  end
end
