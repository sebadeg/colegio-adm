class LineaFactura < ApplicationRecord
  belongs_to :factura
  belongs_to :alumno

  def factura_tostr
  	return factura != nil ? factura.tostr() : ""
  end

  def alumno_tostr
  	return alumno != nil ? alumno.tostr() : ""
  end

  def alumno_nombre_apellido_tostr
  	return alumno != nil ? "#{alumno.nombre} #{alumno.apellido}" : ""
  end
end
