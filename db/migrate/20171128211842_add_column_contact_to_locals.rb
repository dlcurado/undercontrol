class AddColumnContactToLocals < ActiveRecord::Migration[5.0]
  def change
    add_column :locals, :nome_contato, :string
    add_column :locals, :email, :string
    add_column :locals, :telefone, :string
  end
end
