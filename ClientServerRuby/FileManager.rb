class FileManager

  def self.writeUser user
    file = File.new('Data.txt', 'a+')
    if file
      file.syswrite(user+"\n")
      return true
    else
       return false
    end
  end


  def self.reWriteFile
    file= File.open('Data.txt','w')
    if file
      file.syswrite(" ")
      file.close()
    end
  end
  
  def self.search username
    file=File.open('Data.txt').read
    file.gsub!(/\r\n?/, "\n")
    file.each_line do |line|
      if line.to_s.include? username
        return line.to_s
      end
    end
    return ' '
  end

  def self.isUnique str
    file=File.open('Data.txt').read
    file.gsub!(/\r\n?/, "\n")
    file.each_line do |line|
      if line.to_s.include? str
        return false
      end
    end
    return true
  end

  def self.getUsers
    users=""
    file = File.open('Data.txt').read
    file.gsub!(/\r\n?/, "\n")
    file.each_line do |line|
      users+=line
    end
    return users
  end
  
end