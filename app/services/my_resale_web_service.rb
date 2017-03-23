module MyResaleWebService
  def self.fetch_balance(consignor_id, consignor_last_name)
    agent = Mechanize.new
    signin_page = agent.get('http://www.myresaleweb.com/')
    signin_form = signin_page.form_with(action: "../signin.asp")

    signin_form.state = "UT"
    signin_form.storeid = "BK1652"
    signin_form.consignorid = consignor_id
    signin_form.consignorlastname = consignor_last_name

    submit_button = signin_form.button_with(value: "Check My Account")
    balances_page = signin_form.click_button(submit_button)
    balances_content_raw = balances_page.css("div#consigner_content_text p")
    balances_content = balances_content_raw.map do |p_tag|
      [
        p_tag.at_css("strong").text.chomp(":"),
        p_tag.at_css("span").text
      ]
    end.to_h

    balance = balances_content["Balance"]
  end
end
