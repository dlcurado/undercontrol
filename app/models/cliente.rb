class Cliente < ApplicationRecord
	has_many :eventos, :dependent => :destroy
	has_many :historicos, through: :eventos
	
	accepts_nested_attributes_for :eventos, :allow_destroy => true
	
	validates :nome, presence: true
	validates :telefone, presence: true
end
