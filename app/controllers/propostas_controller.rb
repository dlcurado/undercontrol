class PropostasController < ApplicationController
	def index
		logger.debug "####### INDEX"
	end
	
	def new
		logger.debug "####### NEW"
		if params[:evento_id].present?
			@evento = Evento.find(params[:evento_id])
			@proposta = @evento.propostas.new
		else
			@proposta = Proposta.new
		end
		
	end
	
	def create
		logger.debug "####### CREATE"
		@evento = Evento.find(params[:evento_id])
		@propostas_inativas = @evento.propostas
		
		#desativando as propostas existentes
		@propostas_inativas.each do |proposta|
			proposta.update(ativa: false)
		end
		
		@evento.propostas.create(proposta_params)
		redirect_to edit_evento_path(@evento)
	end
	
	def edit
		logger.debug "####### EDIT"
		@evento = Evento.find(params[:evento_id])
		@proposta = Proposta.find(params[:id])
		if params[:ativa].present?
			@evento = @proposta.evento
			@evento.propostas.each do |proposta|
				proposta.id != @proposta.id ? proposta.update(ativa: false) : proposta.update(ativa: true)
				redirect_to edit_evento_path @evento 
			end
		end
	end
	
	def show
		logger.debug "####### SHOW"
		@proposta = Proposta.find(params[:id])
		@evento = @proposta.evento
	end
	
	def update
		logger.debug "####### UPDATE"
		@proposta = Proposta.find(params[:id])
		@evento = @proposta.evento
		if params[:ativa].present? && ActiveModel::Type::Boolean.new.cast(params[:ativa]) == true
			# Ja que esta ativando uma proposta, precisamos desativar todas as outras
			logger.debug "####### UPDATE - Atualizando todas as propostas"
			@evento.propostas.each do |proposta_desativa|
				proposta_desativa.update(ativa: false)
				logger.debug "####### UPDATE - Atualizando todas as propostas - " + proposta_desativa.descricao + " || STATUS = FALSE"
			end
		end
		# Depois e so ajustar o status da proposta em questao
		#@proposta.update(ativa: ActiveModel::Type::Boolean.new.cast(params[:ativa]))
		@proposta.update(proposta_params)
		
		redirect_to edit_evento_path @evento
	end
	
	private def proposta_params
		params.require(:proposta).permit(:numero, :descricao, :valor, :ativa)
	end
	
end
