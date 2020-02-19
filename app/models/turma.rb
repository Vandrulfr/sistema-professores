class Turma < ApplicationRecord
  belongs_to :user, optional: true
  has_many :alunos

  accepts_nested_attributes_for :user, :alunos
end
