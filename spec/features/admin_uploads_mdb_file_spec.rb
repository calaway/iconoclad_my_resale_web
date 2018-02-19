require 'rails_helper'

feature 'Admin uploads mdb file', type: :feature do
  let(:admin) { User.create(name: 'Anorak', admin: true) }
  before do
    stub_login(admin)
  end

  scenario 'the records are loaded in the database' do
    visit new_admin_upload_path

    attach_file('Upload consign.mdb file', Rails.root.join('spec', 'fixtures', 'consign.mdb'))
    click_on('Submit')

    expect(Customer.count).to eq(3497)
  end
end
