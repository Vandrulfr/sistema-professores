module TurmaHelper
  def cria_turma()
    visit '/'
    click_link 'Login'
    fill_in('Login', with: '1')
    fill_in('Password', with: 'password')
    click_button('Log in')
    click_link('Turmas', match: :first)
    click_link('Novo')
    fill_in('Nome', with: 'Materia')
    fill_in('Inicio', with: '14')
    fill_in('Fim', with: '16')
    fill_in('turma_dias', with: 'seg')
    fill_in('turma_carga_minima', with: '0')
    fill_in('turma_carga_maxima', with: '10')
    fill_in('turma_capacidade', with: '2')
    click_button('Criar')
  end
end
RSpec.configure do |config|
  config.include(TurmaHelper)
end
