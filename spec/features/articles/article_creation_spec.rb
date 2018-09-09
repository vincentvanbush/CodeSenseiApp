require 'rails_helper'

RSpec.describe 'article creation', js: true do
  before do
    User.create(email: 'qwer@asdf.pl', password: 'qwer1234')
  end

  it 'creates an article' do
    visit root_path
    click_link_or_button 'Blog Articles'
    click_link_or_button 'New Article'
    fill_in 'Email', with: 'qwer@asdf.pl'
    fill_in 'Password', with: 'qwer1234'
    click_button 'Log in'
    fill_in 'Article Title', with: 'tytuł'
    fill_in 'This is your article content...', with: 'treść'
    click_link_or_button 'Create a Article'
    expect(page).to have_text 'created successfully'
    expect(page).to have_text 'tytuł'
  end
end
