class AddCheioToTurma < ActiveRecord::Migration[6.0]
  def change
    add_column :turmas, :cheio, :boolean
  end
end
