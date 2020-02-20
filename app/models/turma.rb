class Turma < ApplicationRecord
  belongs_to :user, optional: true
  has_many :alunos

  accepts_nested_attributes_for :user, :alunos

  scope :dia_nao_conflitante, ->(dias) { where.not(dias: dias) }
  scope :horario_nao_conflitante, -> (inicio, fim) do
    where.not(':inicio >= inicio and :inicio < fim', inicio: inicio).where.not(':fim > inicio and :fim <= fim', fim: fim)
  end

  scope :disponiveis, -> (inicio, fim, dia) do
    dia_nao_conflitante(dia).or(horario_nao_conflitante(inicio, fim))
  end



  def check_cheio
    update(cheio: (Aluno.where(turma_id: id).length >= capacidade))
  end
end
