class AddTurmaToAluno < ActiveRecord::Migration[6.0]
  def change
    add_reference :alunos, :turma, null: true, foreign_key: true
  end
end
