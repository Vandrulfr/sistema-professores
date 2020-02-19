class AddNomeToTurma < ActiveRecord::Migration[6.0]
  def change
    add_column 'turmas', 'nome', :string
  end
end
