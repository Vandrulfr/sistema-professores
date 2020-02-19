class Turma < ApplicationRecord
  belongs_to :user, optional: true
  has_many :alunos
end
