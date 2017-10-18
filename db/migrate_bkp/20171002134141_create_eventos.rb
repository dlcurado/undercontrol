class CreateEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :eventos do |t|
      t.belongs_to :cliente, index: true
      t.datetime :data_evento
      t.text :local_evento
      t.datetime :hora_montagem
      t.datetime :hora_desmontagem
      t.references :historico, foreign_key: true

      t.timestamps
    end

    remove_foreign_key :historicos, column: :cliente_id
    add_reference :historicos, :evento, polymorphic: true
  end
end
