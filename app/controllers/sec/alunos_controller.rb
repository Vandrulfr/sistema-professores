# frozen_string_literal: true

class Sec::AlunosController < ApplicationController
  load_and_authorize_resource :aluno, parent: false
  def index
    @aluno = Aluno.all
  end

  def create
    if @aluno.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new; end

  def edit; end

  def update
    if @aluno.update(aluno_params)
      redirect_to sec_alunos_path
    else
      render 'sec/alunos/edit'
    end
  end

  private

  def aluno_params
    params.require(:aluno).permit(:nome, :email, :matricula)
  end
end