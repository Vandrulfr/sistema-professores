require 'rails_helper'

RSpec.feature 'Criar Alunos', type: :feature, js: true do
  scenario 'Secretário cria aluno' do
    FactoryBot.rewind_sequences
    create(:user, :sec)
    visit '/'
    click_link 'Login'
    fill_in('Login', with: '1')
    fill_in('Password', with: 'password')
    click_button('Log in')
    click_link('Criar Aluno')
    fill_in('Email', with: generate(:email))
    fill_in('Matricula', with: generate(:matricula))
    fill_in('Nome', with: generate(:name))
  end
end
