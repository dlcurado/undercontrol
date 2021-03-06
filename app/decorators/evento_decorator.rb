﻿module EventoDecorator

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
		if data_evento.nil?
			"Não definida"
		else
			data_evento.strftime("%d/%m/%Y")
		end
		#.to_formatted_s(:short)
	end
	
	def proposta_ativa
		propostas.each do |proposta|
			if proposta.ativa
				return proposta
			end
		end
		return "Sem proposta ativa"
	end
	
	def img
		case tipo_evento.id
		when 1
			"corporativo.png"
		when 2
			"formatura.png"
		when 3
			"casamento.png"
		when 4
			"debutante.png"
		else
			"outros.png"
		end
	end
end