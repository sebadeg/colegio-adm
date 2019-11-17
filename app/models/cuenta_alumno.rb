class CuentaAlumno < ApplicationRecord
  belongs_to :cuenta
  belongs_to :alumno

  def cuenta_tostr
  	return cuenta != nil ? "#{cuenta.id} - #{cuenta.nombre}" : ""
  end

  def alumno_tostr
  	return alumno != nil ? "#{alumno.id} - #{alumno.nombre} #{alumno.apellido}" : ""
  end

end
