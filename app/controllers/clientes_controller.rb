class ClientesController < ApplicationController
	def index
	   if params.has_key?("commit")
		 filtro = []
		   if params[:cliente].present? && params[:cliente] != "Nome"
				nome = params[:cliente]
				filtro << ["LOWER(nome) like '%#{nome.downcase}%'"]
		   end
		   
		   if params[:telefone].present? && params[:telefone] != "Telefone"
				telefone = params[:telefone]
				filtro << ["LOWER(telefone) like '%#{telefone.downcase}%'"]
		   end
		   
		   if params[:email].present? && params[:email] != "E-mail"
				email = params[:email]
				filtro << ["LOWER(email) like '%#{email.downcase}%'"]
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
	
	##############################################################################
	######                         AJAX EVENTS                       ########
	##############################################################################
	def get_by_term
		if params.has_key?("term")
			@clientes = Cliente.where('LOWER(nome) like ?', "%#{params[:term].downcase}%")
			@clientes_array = Array.new
			@clientes.each do |cliente|
				@clientes_array << cliente.nome
			end
			
			respond_to do |format|
				format.json { render json: @clientes_array, status: :created }#, location: @eventos }
			end
		end
	end
	
	private def clientes_params
		params.require(:cliente).permit(:nome, :telefone, :email)
	end
end
