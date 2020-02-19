# frozen_string_literal: true

# classe de modelo de alunos
class Aluno < ApplicationRecord
  belongs_to :turma, optional: true
  validates_uniqueness_of :matricula, on: :create
  validates_presence_of :matricula

  validates_uniqueness_of :nome
  validates_presence_of :nome

  validates_format_of :email, with: /\A[^@\s]+@[^@\s]+\z/
end

