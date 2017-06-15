module MyResaleWebService
  def self.balance_page_content(consignor_id, consignor_last_name)
    balance_page = signin(consignor_id, consignor_last_name)
    parse_balance_page_content(balance_page)
  end

  def self.signin(consignor_id, consignor_last_name)
    signin_page = open_web_page('http://www.myresaleweb.com/')
    signin_form = signin_page.form_with(action: "../signin.asp")
    form_values = {"state" => "UT",
                   "storeid" => "BK1652",
                   "consignorid" => consignor_id,
                   "consignorlastname" => consignor_last_name}
    fill_form(signin_form, form_values)
    submit_with_button(signin_form, "Check My Account")
  end

  def self.open_web_page(url)
    agent = Mechanize.new
    agent.get(url)
  end

  def self.fill_form(form, values)
    values.each do |key, value|
      form[key] = value
    end
  end

  def self.submit_with_button(form, button_value)
    submit_button = form.button_with(value: button_value)
    form.click_button(submit_button)
  end

  def self.parse_balance_page_content(balance_page)
    balances_content_raw = balance_page.css("div#consigner_content_text p")
    balances_content = balances_content_raw.map do |p_tag|
      [p_tag.at_css("strong").text.chomp(":"),
       p_tag.at_css("span").text]
    end.to_h
  end
end
