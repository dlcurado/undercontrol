class LocaisController < ApplicationController
	def index
		logger.debug "*************************** INDEX"
		@locais = Local.all
	end
	
	def show
		logger.debug "*************************** SHOW"
		@evento = Evento.find(params[:id])
		@cliente = @evento.cliente
	end
	
	def new
		logger.debug "*************************** NEW"
		@evento = Evento.new
		clientes = @clientes
	end
	
	def create
		logger.debug "*************************** CREATE"
		@cliente = Cliente.find(params_evento[:cliente_id])
		@evento = @cliente.eventos.new(params_evento)
		
		if @evento.save
			redirect_to action: "index"
		else
			render "new"
		end
	end
	
	def edit
		logger.debug "*************************** EDIT"
		@evento = Evento.find(params[:id])
	end
	
	def update
		logger.debug "*************************** UPDATE"
		@evento = Evento.find(params[:id])
		if @evento.update(params_evento)
			logger.debug "Atualizando os valores de "
			logger.debug params_evento
			redirect_to action: "index"
		else
			render "new"
		end
	end
	
	def destroy
		@evento = Evento.find(params[:id])
		@evento.destroy
		redirect_to eventos_path
	end
	
	
	private def params_evento
		params.require(:evento).permit(:id, :cliente_id, :data_evento, :local_evento,
			:hora_montagem, :hora_desmontagem, historicos_attributes: [:id, :descricao, :created_at])
	end
end
