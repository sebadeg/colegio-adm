class Config < ApplicationRecord

  def self.anio_corriente
  	return Config.where(nombre: "año corriente").first!.valor.to_i
  end

end
