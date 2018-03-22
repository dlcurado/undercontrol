class AddNumeroValorToPropostas < ActiveRecord::Migration[5.0]
  def change
    add_column :propostas, :numero, :string
    add_column :propostas, :valor, :decimal
  end
end
