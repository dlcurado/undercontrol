class Evento < ApplicationRecord
	belongs_to :cliente
	has_many :historicos, :dependent => :destroy
	accepts_nested_attributes_for :historicos, :allow_destroy => true
	#:reject_if => lambda { |a| a[:content].blank? },
	belongs_to :tipo_evento
	
	validates :data_evento, presence: true
	validates :local_evento, presence: true
	validates :hora_montagem, presence: true
	validates :hora_desmontagem, presence: true
	
	def data_evento_is_data
		errors.add(:data_evento, "Não pode ser nulo!") if :data_evento.nil?
		begin
			Date.parse(:evento.data_evento)
		rescue
			errors.add(:evento, "Erro de conversão")
		end
	end
	
	STATUS = {
		0 => 'Solicitado orçamento', 
		1 => 'Aguardando retorno do cliente', 
		2 => 'Em negociação', 
		3 => 'Cancelada', 
		4 => 'Fechada'
	}.freeze
end
