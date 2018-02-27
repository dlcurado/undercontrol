class CreateProposta < ActiveRecord::Migration[5.0]
  def change
    create_table :proposta do |t|
      t.references :evento, foreign_key: true
      t.text :descricao
      t.boolean :ativa

      t.timestamps
    end
  end
end
