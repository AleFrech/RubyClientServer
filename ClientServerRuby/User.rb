require_relative 'Validations'
class User
  attr_accessor :Username
  attr_accessor :Name
  attr_accessor :Email
  attr_accessor :Cedula
  attr_accessor :Fecha
  attr_accessor :Img

  def initialize (username, name, email, cedula, fecha, img)
    @Username = username
    @Name = name
    @Email = email
    @Cedula = cedula
    @Fecha = fecha
    @Img = img
  end

  def to_s
    return @Username+','+@Name+','+@Email+','+@Cedula+','+@Fecha+','+@Img
  end
end