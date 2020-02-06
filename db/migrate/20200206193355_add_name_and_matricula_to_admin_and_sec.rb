class AddNameAndMatriculaToAdminAndSec < ActiveRecord::Migration[6.0]
  def change
    add_column :secs, 'name', :string
    add_column :admins, 'name', :string
    add_column :secs, 'matricula', :string
    add_column :admins, 'matricula', :string
  end
end
