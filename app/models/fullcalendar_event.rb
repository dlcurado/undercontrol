class FullcalendarEvent
	include ActiveModel::Model
		
	attr_accessor :title, :start, :end, :backgroundColor,	
		:cliente_id, :cliente_nome,
		:data_evento,
    	:hora_montagem,
    	:hora_desmontagem,
   		:created_at,
    	:updated_at,
    	:tipo_evento,
    	:evento_status,
    	:local_id, :local_nome,
    	:observacao,
    	:quantidade_horas,
    	:proposta
end
