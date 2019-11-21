class ActividadOpcionConcepto < ApplicationRecord

  def nombre_clase()
  	return "Concepto de opción de actividad"
  end

  def tostr()
  	return "#{nombre}" 
  end

  def self.coleccion()
  	return ActividadOpcionConcepto.all.order(:nombre).map{|u| [u.tostr(),u.id]} 
  end

end
