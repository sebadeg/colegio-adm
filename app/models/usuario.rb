class Usuario < ApplicationRecord
  has_many :titular_cuenta, :dependent => :delete_all
  accepts_nested_attributes_for :titular_cuenta, allow_destroy: true

  has_many :padre_alumno, :dependent => :delete_all
  accepts_nested_attributes_for :padre_alumno, allow_destroy: true

  def nombre_clase()
  	return "Padre/Titular"
  end

  def tostr()
  	return "#{nombre} #{apellido}" 
  end

  def self.coleccion()
  	return Usuario.all.order(:nombre,:apellido).map{|u| [u.tostr(),u.id]}
  end
end