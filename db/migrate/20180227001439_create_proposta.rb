class CreateProposta < ActiveRecord::Migration[5.0]
  def change
    create_table :propostas do |t|
      t.belongs_to :evento, index: true, foreign_key: true
      t.text :descricao
      t.boolean :ativa

      t.timestamps
    end
  end
end
