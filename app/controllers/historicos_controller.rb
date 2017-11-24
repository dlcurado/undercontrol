class HistoricosController < ApplicationController
	def index
		
		if params[:evento_id].present?
			logger.debug "*************************** INDEX HISTORICO"
			@evento = Evento.find(params[:evento_id])
		
			@historicos = @evento.historicos
		else
			@historicos = Historico.all
		end
			
	end
	
	def show
		
		if params[:id].present?
			@historicos = Historico.find(params[:id])
		elsif params[:evento_id].present?
			logger.debug "*************************** INDEX HISTORICO"
			@evento = Evento.find(params[:evento_id])
			@historicos = @evento.historicos
		else
			@historicos = Historico.all
		end
			
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
