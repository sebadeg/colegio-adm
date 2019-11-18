class CuentaAlumno < ApplicationRecord
  belongs_to :cuenta
  belongs_to :alumno

  def cuenta_tostr
  	return cuenta != nil ? cuenta.tostr() : ""
  end

  def alumno_tostr
  	return alumno != nil ? alumno.tostr() : ""
  end

end
