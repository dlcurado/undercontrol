class CreateEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :eventos do |t|
      t.belongs_to :cliente, index: true, foreign_key: true
      t.datetime :data_evento
      t.text :local_evento
      t.datetime :hora_montagem
      t.datetime :hora_desmontagem
      
      t.timestamps
    end
  end
end
