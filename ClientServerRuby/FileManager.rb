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
    users=self.getUsers
    userlist = users.split("\n")
    userlist.each do |usr|
      tokens=usr.split(",")
      if tokens[0]==username
        return usr
      end
    end
    return ' '
  end

  def self.isUnique str,pos
    users=self.getUsers
    userlist = users.split("\n")
    if  userlist.length<=1
      return true
    end
    userlist.each do |usr|
      tokens=usr.split(",")
      if tokens[pos]<=1
        return true
      end
      if tokens[pos]==str
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

