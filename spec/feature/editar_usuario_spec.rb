require 'rails_helper'

RSpec.feature 'Editar Usuarios', type: :feature, js: true do
  scenario 'admin edita outro usuario' do
    FactoryBot.rewind_sequences
    create(:user, :admin)
    create(:user, :sec)
    visit '/'
    click_link 'Login'
    fill_in('Login', with: '1')
    fill_in('Password', with: 'password')
    click_button('Log in')
    click_link('Mostrar Usuários')
    find(:xpath, '/html/body/div[2]/table/tbody/tr[3]/td[5]/a').click
    fill_in('user_name', with: 'Novo Nome')
    click_button('Salvar')
    expect(page).to have_text('Novo Nome')
  end

  scenario 'usuario edita o proprio email' do
    FactoryBot.rewind_sequences
    create(:user, :professor)
    visit '/'
    click_link 'Login'
    fill_in('Login', with: '1')
    fill_in('Password', with: 'password')
    click_button('Log in')
    click_link('Alterar e-mail')
    fill_in('Email', with: 'novoemail@gmail.com')
    click_button('Salvar')
    expect(page).to have_text('novoemail@gmail.com')
  end
end