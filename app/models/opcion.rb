class Opcion < ApplicationRecord
  belongs_to :grado

  def grado_tostr
  	return grado != nil ? grado.tostr() : ""
  end

end
