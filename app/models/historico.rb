class Historico < ApplicationRecord
	belongs_to :evento
	has_one :cliente, through: :evento
end
