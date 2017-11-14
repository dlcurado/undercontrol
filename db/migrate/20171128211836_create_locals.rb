class CreateLocals < ActiveRecord::Migration[5.0]
  def change
    create_table :locals do |t|
      t.string :nome
      t.string :endereco
      t.string :cidade
      t.string :estado
      t.string :telefone
      t.time :horario_montagem
      t.time :horario_desmontagem

      t.timestamps
    end
  end
end
