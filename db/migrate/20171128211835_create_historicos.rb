class CreateHistoricos < ActiveRecord::Migration[5.0]
  def change
    create_table :historicos do |t|
      t.belongs_to :evento, index: true, foreign_key: true
	  t.text :descricao
      
      t.timestamps
    end
  end
end
