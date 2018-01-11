class ClientesController < ApplicationController
	def index
	   if params.has_key?("commit")
		 filtro = []
		   if params[:cliente].present? && params[:cliente] != "Nome"
				nome = params[:cliente]
				filtro << ["nome like '#{nome}%'"]
		   end
		   
		   if params[:telefone].present?
				telefone = params[:telefone]
				filtro << ["telefone like '#{telefone}%'"]
		   end
		   
		   if params[:email].present?
				email = params[:email]
				filtro << ["email like '#{email}%'"]
		   end

		   @clientes = Cliente.all.where(filtro.join(" AND "))
	   else
		   @clientes = Cliente.all
	   end
	   
	   logger.debug @clientes
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
