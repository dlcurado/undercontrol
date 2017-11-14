class CreateTipoEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_eventos do |t|
      t.text :descricao

      t.timestamps
    end
  end
end
