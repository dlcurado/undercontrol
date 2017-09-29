class Cliente < ApplicationRecord
	has_many :historicos, dependent: :destroy
	
	validates :nome, presence: true
	validates :telefone, presence: true
end
