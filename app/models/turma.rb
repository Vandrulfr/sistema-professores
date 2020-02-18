class Turma < ApplicationRecord
  belongs_to :user
  has_many :alunos
end
