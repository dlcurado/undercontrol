class AddEventoStatusToEventos < ActiveRecord::Migration[5.0]
  def change
    add_column :eventos, :evento_status, :integer
  end
end
