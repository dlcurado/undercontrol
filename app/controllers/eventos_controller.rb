class EventosController < ApplicationController
	def index
		logger.debug "*************************** INDEX"
		
		filtro = []

		if params.has_key?("commit")
			logger.debug params[:commit]
			
			clientes = nil
			if (params[:nome].present? && params[:nome] != "Nome Auto Complete")
				nome = params[:nome].downcase
				#filtro << ["LOWER(nome) like '%#{nome}%'"]
				clientes = Cliente.where("LOWER(nome) like '%#{nome}%'")
			end
			
			if (params[:data_evento].present? && params[:data_evento] != 'Data do evento')
				data_evento = Date.strptime(params[:data_evento], "%m/%d/%Y")
				filtro << ["data_evento = '#{data_evento}'"]
			end
			
			if params[:evento_status].present?
				logger.debug "Encontrou o parametro evento_status"
				id = params[:evento_status]
				filtro << ["evento_status = #{id.to_i}"]
			end
			
			if clientes.nil?
				@eventos = Evento.all.where(filtro.join(" AND ")).order("data_evento DESC")
			else
				cliente_todos = Cliente.new
				clientes.each do |cliente|
					cliente_todos.eventos << cliente.eventos.where(filtro.join(" AND ")).order("data_evento DESC")
				end
				@eventos = cliente_todos.eventos
			end
			
			logger.debug "*************************** COMMIT"			
		elsif params.has_key?("cliente_id")
			@cliente = Cliente.find(params[:cliente_id])
			@eventos = @cliente.eventos
			logger.debug "*************************** CLIENTE"
		else
			@eventos = Evento.where("data_evento > ? AND data_evento < ?", 
				Date.today.beginning_of_month, Date.today.end_of_month)
				
			@eventos_by_date = @eventos.group_by(&:data_evento)
			@date = params[:date] ? Date.parse(params[:date]) : Date.today
			logger.debug "*************************** EVENTOS"			
		end
		
	end
	
	def show
		@evento = Evento.find(params[:id])
	end
	
	
	def new
		@evento = Evento.new
	end
	
	def create
		@cliente = Cliente.find(params_evento[:cliente_id])
		@evento = @cliente.eventos.new(params_evento)
		
		if @evento.save
			redirect_to action: "index"
		else
			render "new"
		end
	end
	
	def edit
		@evento = Evento.find(params[:id])
	end
	
	def update
		@evento = Evento.find(params[:id])
		if @evento.update(params_evento)
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
		end
	end
	
	def show_many
		@eventos = Evento.where('data_evento = ?', params[:date])
		respond_to do |format|
			format.js
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
