class AddColumnsToEventos < ActiveRecord::Migration[5.0]
  def change
    add_column :eventos, :observacao, :string
    add_column :eventos, :quantidade_horas, :string
  end
end
