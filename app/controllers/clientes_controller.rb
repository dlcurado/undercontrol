class ClientesController < ApplicationController
	def index
		@clientes = Cliente.all
	end

	def create
		@cliente = Cliente.new(clientes_params)
		
		if @cliente.save
			redirect_to clientes_path
		else
			render 'new'
		end
		
	end

	def new
		@cliente = Cliente.new
	end

	def edit
		@cliente = Cliente.find(params[:id])
	end

	def show
		@cliente = Cliente.find(params[:id])
	end

	def update
		@cliente = Cliente.find(params[:id])
		
		if @cliente.update(clientes_params)
			redirect_to clientes_path
		else
			render 'edit'
		end
	end

	def destroy
		@cliente = Cliente.find(params[:id])
		@cliente.destroy
		redirect_to clientes_path
	end
	
	private def clientes_params
		params.require(:cliente).permit(:nome, :telefone, :email)
	end
end
