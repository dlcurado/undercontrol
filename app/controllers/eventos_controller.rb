class EventosController < ApplicationController
	def index
		logger.debug "*************************** INDEX"
		
		filtro = []

		if params.has_key?("commit")
			logger.debug "*************************** INDEX - Filtros da pagina de listagem"
		
			clientes = nil
			if (params[:nome].present? && params[:nome] != "Nome")
				nome = params[:nome].downcase
				clientes = Cliente.where("LOWER(nome) like '%#{nome}%'")
			end
			
			if (params[:data_evento].present? && params[:data_evento] != 'Data do evento')
				data_evento = Date.strptime(params[:data_evento], "%d/%m/%Y")
				filtro << ["data_evento = '#{data_evento}'"]
			end
			
			if params[:evento_status].present?
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
			
		elsif params.has_key?("cliente_id")
			logger.debug "*************************** INDEX - Listando um cliente só"
			@cliente = Cliente.find(params[:cliente_id])
			@eventos = @cliente.eventos
		else
			logger.debug "*************************** INDEX - Eventos por um período"
			@eventos = Evento.where("data_evento > ? AND data_evento < ?", 
				Date.today.beginning_of_month, Date.today.end_of_month)
				
			@eventos_by_date = @eventos.group_by(&:data_evento)
			@date = params[:date] ? Date.parse(params[:date]) : Date.today
		end
		
	end
	
	def show
		@evento = Evento.find(params[:id])
	end
	
	
	def new
		logger.debug "*************************** NEW"
		
		@evento = Evento.new
		@evento.build_cliente
		@evento.build_local
		
		if @evento.propostas.empty?
			logger.debug "true"
		else
			logger.debug "false"
		end 
	end
	
	def create
		#@cliente = Cliente.find(params_evento[:cliente])
		@cliente = Cliente.new(params_evento[:cliente_attributes])
		@evento = @cliente.eventos.new(params_evento)
		@evento.local = Local.new(params_evento[:local_attributes])
		
		if @evento.save
			redirect_to action: "index"
		else
			render "new"
		end
	end
	
	def edit
		logger.debug "*************************** EDIT"
		@evento = Evento.find(params[:id])
		#@evento.cliente.build

		if @evento.propostas.empty?
			logger.debug "true"
		else
			logger.debug "false"
		end 
	end
	
	def update
		@evento = Evento.find(params[:id])
		logger.debug @evento
		logger.debug params_evento
		if @evento.update(params_evento)
			logger.debug @evento.data_evento
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
		
		filtro = []
		
		if (params[:start].present? && params[:end].present?)
			filtro << ["data_evento > '#{params[:start]}' AND data_evento < '#{params[:end]}'"]
		end
		 
			
		if (params[:status].present?)
			array_status = params[:status].map(&:to_i)
			str_status = "evento_status in (" + array_status.join(" , ") + ")"
			filtro << str_status
		end
			
		@eventos = Evento.where(filtro.join(" AND ")).order("data_evento DESC")
		
		
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
		params.require(:evento).permit(:id, :data_evento, :local_id,
			:tipo_evento_id, :evento_status, :hora_montagem, :hora_desmontagem, 
			cliente_attributes: [:id, :nome, :telefone, :email],
			local_attributes: [:id, :nome, :endereco, :cidade, :estado],
			historicos_attributes: [:id, :descricao],
			propostas_attributes: [:id, :descricao, :ativa])
	end
end
