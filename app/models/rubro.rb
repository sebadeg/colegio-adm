class Rubro < ApplicationRecord

  def nombre_clase()
  	return "Rubro"
  end

  def tostr()
  	return "#{id} - #{nombre}" 
  end

  def self.coleccion()
  	return Rubro.all.order(:nombre).map{|u| [u.tostr(),u.id]} 
  end

end
