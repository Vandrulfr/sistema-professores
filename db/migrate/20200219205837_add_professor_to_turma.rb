class AddProfessorToTurma < ActiveRecord::Migration[6.0]
  def change
    add_reference :turmas, :user, null: true, foreign_key: true
  end
end
