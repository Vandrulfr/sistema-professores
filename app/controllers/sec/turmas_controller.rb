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

  def edit; end

  def update
    if @turma.update(turma_params)
      redirect_to sec_turmas_path
    else
      render 'sec/turmas/edit'
    end
  end

  private

  def turma_params
    params.require(:turma).permit(:inicio, :fim, :dias, :capacidade,
                                  :carga_minima, :carga_maxima)
  end
end
