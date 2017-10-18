class HistoricosController < ApplicationController
	def index
		logger.debug "*************************** INDEX HISTORICO"
		@evento = Evento.find(params[:evento_id])
		
		@historicos = @evento.historicos
	end
	
	
	def new
		logger.debug "*************************** NEW HISTORICO"
		@evento = Evento.find(params[:evento_id])
		@historico = @evento.historicos.new
	end
	
	def edit
		logger.debug "*************************** EDIT HISTORICO"
		@evento = Evento.find(params[:evento_id])
		@historico = @evento.historicos.find(params[:id])
	end
	
	def create
		logger.debug "*************************** CREATE HISTORICO"
		@evento = Evento.find(params[:evento_id])
		@historico = @evento.historicos.create(historico_params)
		redirect_to evento_path(@evento)
	end
	
	def destroy
		logger.debug "*************************** DESTROY HISTORICO"
		@evento = Evento.find(params[:evento_id])
		@historico = @evento.historicos.find(params[:id])
		@historico.destroy
		redirect_to evento_path(@evento)
	end
	
	private def historico_params
		params.require(:historico).permit(:descricao, :cliente_id)
	end
end
