class AddTipoEventoRefToEventos < ActiveRecord::Migration[5.0]
  def change
    add_reference :eventos, :tipo_evento, foreign_key: true
  end
end
