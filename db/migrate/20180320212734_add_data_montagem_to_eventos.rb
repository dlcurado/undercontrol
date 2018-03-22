class AddDataMontagemToEventos < ActiveRecord::Migration[5.0]
  def change
    add_column :eventos, :data_montagem, :date
    add_column :eventos, :data_desmontagem, :date
    change_column :eventos, :hora_montagem, :time
    change_column :eventos, :hora_desmontagem, :time
  end
end
