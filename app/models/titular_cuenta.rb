class TitularCuenta < ApplicationRecord
  belongs_to :cuenta
  belongs_to :usuario

  def usuario_tostr
  	return usuario != nil ? usuario.tostr() : ""
  end

  def cuenta_tostr
  	return cuenta != nil ? cuenta.tostr() : ""
  end
end
