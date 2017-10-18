class Cliente < ApplicationRecord
	has_many :eventos, :dependent => :destroy
	has_many :historicos, through: :eventos
	
	validates :nome, presence: true
	validates :telefone, presence: true
end
