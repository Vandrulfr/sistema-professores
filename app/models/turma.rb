class Turma < ApplicationRecord
  belongs_to :user, optional: true
  has_many :alunos

  accepts_nested_attributes_for :user, :alunos

  def check_cheio
    update(cheio: (Aluno.where(turma_id: id).length >= capacidade))
  end
end
