class CreateHistoricos < ActiveRecord::Migration[5.0]
  def change
    create_table :historicos do |t|
      t.text :descricao
      t.references :cliente, foreign_key: true

      t.timestamps
    end
  end
end
