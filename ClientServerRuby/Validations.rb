require_relative 'FileManager'
class Validations
  def self.VerifyEmail str
    if str.to_s.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/) and FileManager.isUnique str,2
      return 1
    else
      return -1
    end
  end

  def self.VerifyCedula str
    if str.to_s.match(/\d{4}-\d{4}-\d{5}/) and FileManager.isUnique str,3
      return 1
    else
      return -1
    end
  end

  def self.VerifyDate str
    if str.to_s.match(/\d{2}-\d{2}-\d{4}/)
      return 1
    else
      return -1
    end
  end
  def self.VerifyUser str
    if FileManager.isUnique str,0
      return 1
    else
      return -1
    end
  end

end
