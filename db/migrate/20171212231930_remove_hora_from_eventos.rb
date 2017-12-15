class RemoveHoraFromEventos < ActiveRecord::Migration[5.0]
  def change
    remove_column :eventos, :hora_montagem, :datetime
    remove_column :eventos, :hora_desmontagem, :datetime
  end
end
