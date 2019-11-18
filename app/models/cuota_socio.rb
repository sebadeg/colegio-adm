class CuotaSocio < ApplicationRecord
  belongs_to :socio

  def nombre_clase()
  	return "Cuota de socio"
  end

  def tostr()
  	return "#{socio.tostr()} de #{fecha.strftime("%d/%m/%Y")}"
  end

  def socio_tostr
  	return socio != nil ? socio.tostr() : ""
  end

end
