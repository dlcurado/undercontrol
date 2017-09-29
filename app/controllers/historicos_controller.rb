class HistoricosController < ApplicationController
	def create
		@cliente = Cliente.find(params[:cliente_id])
		@historico = @cliente.historicos.create(historico_params)
		redirect_to cliente_path(@cliente)
	end
	
	def destroy
		@cliente = Cliente.find(params[:cliente_id])
		@historico = @cliente.historicos.find(params[:id])
		@historico.destroy
		redirect_to cliente_path(@cliente)
	end
	
	private def historico_params
		params.require(:historico).permit(:descricao)
	end
end
