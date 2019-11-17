class TitularCuenta < ApplicationRecord
  belongs_to :cuenta
  belongs_to :usuario

  def usuario_tostr
  	return usuario != nil ? "#{usuario.nombre} #{usuario.apellido}" : ""
  end

  def cuenta_tostr
  	return cuenta != nil ? "#{cuenta.id} - #{cuenta.nombre}" : ""
  end
end
