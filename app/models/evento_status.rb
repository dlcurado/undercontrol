class EventoStatus < ActiveRecord::Base
	STATUS = ['Solicitado orçamento', 'Aguardando retorno do cliente', 'Em negociação', 'Cancelada', 'Fechada'].freeze
end
