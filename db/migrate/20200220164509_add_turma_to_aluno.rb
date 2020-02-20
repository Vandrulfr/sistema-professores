class AddTurmaToAluno < ActiveRecord::Migration[6.0]
  def change
    add_reference :alunos, :turmas, null: true, foreign_key: true
  end
end
