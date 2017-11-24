module EventoDecorator

	def prazo_status
		if !historicos.last.nil?
			@data_critica = -10.days.from_now
			@data_moderada = -5.days.from_now
		
			@ultimo_contato = historicos.last.created_at
			
			if @ultimo_contato < @data_critica
				"critica"
			elsif @ultimo_contato < @data_moderada
				"moderada"
			else
				"normal"
			end
		end
	end
	
	def cor_fundo
		case prazo_status
		when "critica"
			"#f77979"
		when "moderada"
			"#ffe947"
		else
			"#ffffff"
		end
	end
	
	def cor_fonte
		case prazo_status
		when "critica"
			"#f77979"
		when "moderada"
			"#ccccff"
		else
			"#ffffff"
		end
	end
	
	def data_ultimo_contato
		@ultimo_historico = historicos.last
		if !@ultimo_historico.nil?
			@ultimo_historico.created_at.strftime("%d/%m/%Y")
		end
	end
	
	def data
		data_evento.strftime("%d/%m/%Y")
		#.to_formatted_s(:short)
	end
			
end