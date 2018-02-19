module Adapter
	class FullcalendarEventAdapter
		attr_accessor :eventos
		
		def initialize(eventos)
			@eventos = eventos
		end
		
		def toFullEvent
			@fullEvents = Array.new
			
			eventos.each do |evento|
				@fullEvents << FullcalendarEvent.new(
					title: evento.cliente.nome, 
					start: evento.data_evento, 
					end: evento.data_evento, 
					backgroundColor: get_color(evento.tipo_evento.descricao),
					cliente_id: evento.cliente.id, 
					cliente_nome: evento.cliente.nome
					#data_evento:,
					#hora_montagem:,
					#hora_desmontagem:,
					#created_at:,
					#updated_at:,
					#tipo_evento:,
					#evento_status:,
					#local_id:,
					#local_nome:,
					#observacao:,
					#quantidade_horas:,
					#proposta:
				)
			
			end
			
			return @fullEvents
		end
		
		private def get_color(tipo_evento)
		case tipo_evento
			when 'CORPORATIVO'
				'blue'
			when 'FORMATURA'
				'gray'
			when 'CASAMENTO'
				'red'
			else
				'pink'
			
		end
	end
		
	end
end