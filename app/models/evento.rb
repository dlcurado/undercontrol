class Evento < ApplicationRecord
	#TODO: Revisar ese relacionamento
	belongs_to :cliente
	belongs_to :local
	belongs_to :tipo_evento
		
	has_many :historicos, :dependent => :destroy
	# nao sei pq criou Prospostas como Propostum (plural)
	has_many :propostas, :dependent => :destroy
	
	accepts_nested_attributes_for :historicos, :allow_destroy => true
	accepts_nested_attributes_for :propostas, :allow_destroy => true
	
	
	#validates :data_evento, presence: true
	#validates :hora_montagem, presence: true
	#validates :hora_desmontagem, presence: true
	
	def data_evento_is_data
		#if :data_evento.nil?
		#	errors.add(:data_evento, "Não pode ser nulo!") 
		#end
		
		begin
			Date.parse(:evento.data_evento)
		rescue
			errors.add(:evento, "Erro de conversão")
		end
	end
	
	STATUS = {
		1 => 'Aberto', 
		2 => 'Aguardando', 
		3 => 'Enviado',
		4 => 'Fechado',
		5 => 'Visitado',
		6 => 'Não fechado'
	}.freeze
end
