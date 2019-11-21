class Lista < ApplicationRecord

  scope "Año corriente", -> { where(anio: Config.anio_corriente) }
  scope :todas, -> { all }


  def nombre_clase()
  	return "Lista"
  end

  def tostr()
  	return "#{nombre}" 
  end

  def self.coleccion()
  	return Lista.where(anio: Config.anio_corriente).order(:nombre).map{|u| [u.tostr(),u.id]} 
  end

end
