class Cuenta < ApplicationRecord
  has_many :titular_cuenta, :dependent => :delete_all
  accepts_nested_attributes_for :titular_cuenta, allow_destroy: true

  has_many :cuenta_alumno, :dependent => :delete_all
  accepts_nested_attributes_for :cuenta_alumno, allow_destroy: true

  def nombre_clase()
  	return "Cuenta"
  end

  def tostr()
  	return "#{id} - #{nombre}" 
  end

  def self.coleccion()
  	return Cuenta.all.order(:id).map{|u| [u.tostr(),u.id]} 
  end
end
