class AddComoConheceuToClientes < ActiveRecord::Migration[5.0]
  def change
    add_column :clientes, :como_conheceu, :string
  end
end
