class TipoEventosController < ApplicationController
	def index
		logger.debug "*************************** INDEX"
		@tiposEvento = TipoEvento.all
		@tipoEvento = TipoEvento.new
	end
	
	def show
		logger.debug "*************************** SHOW"
		@tipoEvento = TipoEvento.find(params[:id])
	end
	
	def new
		logger.debug "*************************** NEW"
		@tipoEvento = TipoEvento.new
		clientes = @clientes
	end
	
	def create
		logger.debug "*************************** CREATE"
		@tipoEvento = TipoEvento.new(params_tipo_evento)
		logger.debug "*************************** Novo Objeto: "
		logger.debug @tipoEvento
		
		if @tipoEvento.save
			redirect_to action: "index"
		else
			render "new"
		end
	end
	
	def edit
		logger.debug "*************************** EDIT"
		@tipoEvento = TipoEvento.find(params[:id])
	end
	
	def update
		logger.debug "*************************** UPDATE"
		@tipoEvento = TipoEvento.find(params[:id])
		if @tipoEvento.update(params_tipo_evento)
			logger.debug "Atualizando os valores de "
			logger.debug params_tipo_evento
			redirect_to action: "index"
		else
			render "new"
		end
	end
	
	def destroy
		@tipoEvento = TipoEvento.find(params[:id])
		@tipoEvento.destroy
		redirect_to tipos_evento_path
	end
	
	
	private def params_tipo_evento
		params.require(:tipo_evento).permit(:descricao)
	end
end
