class EventosController < ApplicationController
	def index
		logger.debug "*************************** INDEX"
		
		filtro = []

		if params.has_key?("commit")
			logger.debug params[:commit]
			
			if params[:evento_status].present?
				logger.debug "Encontrou o parametro evento_status"
				id = params[:evento_status]
				filtro << ["evento_status = #{id.to_i}"]
			end

			@eventos = Evento.all.where(filtro.join(" AND ")).order("data_evento DESC")
			logger.debug "*************************** COMMIT"			
		elsif params.has_key?("cliente_id")
			@cliente = Cliente.find(params[:cliente_id])
			@eventos = @cliente.eventos
			logger.debug "*************************** CLIENTE"
		else
			@eventos = Evento.where("data_evento < '01/02/2018' AND data_evento > '01/01/2018'")
			@eventos_by_date = @eventos.group_by(&:data_evento)
			@date = params[:date] ? Date.parse(params[:date]) : Date.today
			logger.debug "*************************** EVENTOS"			
		end
		
	end
	
	def show
		logger.debug "*************************** SHOW"
		@evento = Evento.find(params[:id])
	end
	
	def show_many
		logger.debug "*************************** SHOW MANY"
		@eventos = Evento.where('data_evento = ?', params[:date])
		respond_to do |format|
			format.js
		end
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
	
	
	##############################################################################
	######                         AJAX EVENTS                       ########
	##############################################################################
	def get_all
		@eventos = Evento.where("data_evento > ? AND data_evento < ?", params[:start], params[:end])
		@fullCalendarAdapter = Adapter::FullcalendarEventAdapter.new(@eventos)
		@json_eventos = @fullCalendarAdapter.toFullEvent
		respond_to do |format|
			format.json { render json: @json_eventos, status: :created }#, location: @eventos }
			logger.debug "*************************** EVENTOS - GET ALL by aJax" 
			logger.debug @json_eventos
		end
	end
	
	def fazer_follow_up
		return true
	end
	
	private def params_evento
		params.require(:evento).permit(:id, :cliente_id, :data_evento, :local_id,
			:tipo_evento_id, :evento_status, :hora_montagem, :hora_desmontagem, 
			historicos_attributes: [:id, :descricao, :created_at])
	end
end
