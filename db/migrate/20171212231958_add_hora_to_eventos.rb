class AddHoraToEventos < ActiveRecord::Migration[5.0]
  def change
    add_column :eventos, :hora_montagem, :datetime
    add_column :eventos, :hora_desmontagem, :datetime
  end
end
