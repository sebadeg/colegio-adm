class Actividad < ApplicationRecord

  scope "Año corriente", -> { where(anio: Config.anio_corriente) }
  scope :todas, -> { all }


  def nombre_clase()
  	return "Actividad"
  end

  def tostr()
  	return "#{nombre}" 
  end

  def self.coleccion()
  	return Actividad.where(anio: Config.anio_corriente).order(:nombre).map{|u| [u.tostr(),u.id]} 
  end

  def rubro_tostr()
  	return rubro != nil ? rubro.tostr() : ""
  end


end
