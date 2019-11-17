class Alumno < ApplicationRecord
  has_many :cuenta_alumno, :dependent => :delete_all
  accepts_nested_attributes_for :cuenta_alumno, allow_destroy: true

  has_many :padre_alumno, :dependent => :delete_all
  accepts_nested_attributes_for :padre_alumno, allow_destroy: true

  def nombre_clase()
  	return "Alumno"
  end

  def tostr()
  	return "#{id} - #{nombre} #{apellido}" 
  end

  def self.coleccion()
  	return Alumno.all.order(:nombre,:apellido).map{|u| [u.tostr(),u.id]} 
  end

end
