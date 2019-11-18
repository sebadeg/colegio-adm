class PadreAlumno < ApplicationRecord
  belongs_to :usuario
  belongs_to :alumno

  def usuario_tostr
  	return usuario != nil ? usuario.tostr() : ""
  end

  def alumno_tostr
  	return alumno != nil ? alumno.tostr() : ""
  end

end
