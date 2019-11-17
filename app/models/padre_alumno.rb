class PadreAlumno < ApplicationRecord
  belongs_to :usuario
  belongs_to :alumno

  def usuario_tostr
  	return usuario != nil ? "#{usuario.nombre} #{usuario.apellido}" : ""
  end

  def alumno_tostr
  	return alumno != nil ? "#{alumno.id} - #{alumno.nombre} #{alumno.apellido}" : ""
  end

end
