class AddColumnDataNascimentoToClientes < ActiveRecord::Migration[5.0]
  def change
    add_column :clientes, :data_nascimento, :date
  end
end
