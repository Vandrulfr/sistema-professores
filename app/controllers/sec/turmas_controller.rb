# frozen_string_literal: true

class Sec::TurmasController < ApplicationController
  load_and_authorize_resource :turma, parent: false
  def index
    @turma = Turma.all
  end

  def create
    if @turma.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new; end

  def edit
    @professores = User.where(role: :professor)
  end

  def update
    if @turma.update(turma_params)
      redirect_to sec_turmas_path
    else
      render 'sec/turmas/edit'
    end
  end

  def destroy
    @turma = Turma.find(params[:id])
    @turma.destroy

    redirect_to sec_turmas_path
  end

  private

  def turma_params
    params.require(:turma).permit(:inicio, :fim, :dias, :capacidade,
                                  :carga_minima, :carga_maxima, :nome, :user_id)
  end
end
