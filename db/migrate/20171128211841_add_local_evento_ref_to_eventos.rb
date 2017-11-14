class AddLocalEventoRefToEventos < ActiveRecord::Migration[5.0]
  def change
    remove_column :eventos, :local_evento, :text
    add_reference :eventos, :local, foreign_key: true
  end
end
