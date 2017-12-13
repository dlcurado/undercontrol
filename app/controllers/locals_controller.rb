class LocalsController < ApplicationController
	def index
		logger.debug "*************************** INDEX"
		@locais = Local.all
	end
	
	def show
		logger.debug "*************************** SHOW"
		@local = Local.find(params[:id])
	end
	
	def new
		logger.debug "*************************** NEW"
		@local = Local.new
	end
	
	def create
		logger.debug "*************************** CREATE"
		@local = Local.new(params_local)
		
		if @local.save
			redirect_to action: "index"
		else
			render "new"
		end
	end
	
	def edit
		logger.debug "*************************** EDIT"
		@local = Local.find(params[:id])
	end
	
	def update
		logger.debug "*************************** UPDATE"
		@local = Local.find(params[:id])
		if @local.update(params_local)
			logger.debug "Atualizando os valores de "
			logger.debug params_local
			redirect_to action: "index"
		else
			render "new"
		end
	end
	
	def destroy
		@local = Local.find(params[:id])
		@local.destroy
		redirect_to locais_path
	end
	
	
	private def params_local
		params.require(:local).permit(:nome, :nome_contato, :telefone, :email, :endereco, 
		:cidade, :estado)
	end
end
