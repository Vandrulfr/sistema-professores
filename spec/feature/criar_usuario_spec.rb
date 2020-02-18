require 'rails_helper'

RSpec.feature 'Criar usuarios', type: :feature, js: true do
  scenario 'Admin cria Secretário' do
    FactoryBot.rewind_sequences
    create(:user, :admin)
    visit '/'
    click_link 'Login'
    fill_in('Login', with: '1')
    fill_in('Password', with: 'password')
    click_button('Log in')
    click_link('Criar Usuario')
    fill_in('Email', with: generate(:email))
    fill_in('Matricula', with: generate(:matricula))
    fill_in('user_name', with: generate(:name))
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    find('#s').click
    click_button('Criar')
    click_link('Mostrar Usuários')
    expect(page).to have_text('John 2 Doe')
  end

  scenario 'Secretário cria professor' do
    FactoryBot.rewind_sequences
    create(:user, :sec)
    visit '/'
    click_link 'Login'
    fill_in('Login', with: '1')
    fill_in('Password', with: 'password')
    click_button('Log in')
    click_link('Criar Professor')
    fill_in('Email', with: generate(:email))
    fill_in('Matricula', with: generate(:matricula))
    fill_in('user_name', with: generate(:name))
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_button('Criar')
    click_link('Mostrar Usuários')
    expect(page).to have_text('John 2 Doe')
  end
end