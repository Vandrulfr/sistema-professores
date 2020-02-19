class AddFieldstoTurma < ActiveRecord::Migration[6.0]
  def change
    add_column 'turmas', 'inicio', :time
    add_column 'turmas', 'dias', :string
    add_column 'turmas', 'fim', :time
    add_column 'turmas', 'capacidade', :integer
    add_column 'turmas', 'carga_minima', :integer
    add_column 'turmas', 'carga_maxima', :integer
  end
end
