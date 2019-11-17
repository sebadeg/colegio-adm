class Grado < ApplicationRecord

  def nombre_clase()
  	return "Grado"
  end

  def tostr()
  	return "#{nombre}" 
  end

  def self.coleccion()
  	return Grado.all.order(:nombre).map{|u| [u.tostr(),u.id]} 
  end

end
