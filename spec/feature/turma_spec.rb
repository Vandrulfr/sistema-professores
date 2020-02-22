require 'rails_helper'

RSpec.feature 'Criar turma', type: :feature, js: true do
  scenario 'Secretário cria turma' do
    FactoryBot.rewind_sequences
    create(:user, :sec)
    cria_turma
    expect(page).to have_text('Materia')
  end
  scenario 'Secretario atribui professor a turma' do
    FactoryBot.rewind_sequences
    create(:user, :sec)
    create(:user, :professor)
    cria_turma
    click_link('Adicionar')
    find('#p').click
    click_button('Salvar')
    expect(page).to have_text('John 2 Doe')
  end
end

