require 'rails_helper'

RSpec.feature 'Criar turma', type: :feature, js: true do
  scenario 'Secretário cria turma' do
    FactoryBot.rewind_sequences
    create(:user, :sec)
    cria_turma
    expect(page).to have_text('Materia')
  end
end

