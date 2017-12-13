class RemoveHorarioFromLocals < ActiveRecord::Migration[5.0]
  def change
    remove_column :locals, :horario_montagem, :time
    remove_column :locals, :horario_desmontagem, :time
  end
end
