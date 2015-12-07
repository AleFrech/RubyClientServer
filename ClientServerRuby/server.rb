require_relative 'FileManager'
require 'mailgun'


class Server
  def self.iniciateServer
    require 'socket'
    s = TCPServer.new('', 3333)
    loop {
      connection = s.accept
      text = connection.recv(1024)
      tokens = text.split('\n')
      if tokens[1] == 'Add'
        FileManager.writeUser(tokens[0])
        connection.write 'Yes' 
      elsif tokens[1] == 'ShowUser'
        usr=FileManager.search(tokens[0])
        if usr==' '
          connection.write 'NO'
        else
          connection.write usr.to_s
        end
      elsif tokens[1]=='DeleteUser'
          users=FileManager.getUsers()
          usersList = users.split("\n")
          FileManager.reWriteFile()
          res='NO'
          usersList.each do |u|
            tok=u.split(',')
            if tokens[0]!=tok[0]
              FileManager.writeUser(u)
            else
              res='YES'
            end
          end
          connection.write res
      elsif tokens[1] =='SendEmail'
        mg_client = Mailgun::Client.new 'key-410b4bd9be9ab2241c624fd0a6bd35bf'
        usr=FileManager.search(tokens[0])
        usrlist=usr.split(',')
        message_params = {:from    => 'ClientServe@info.com',
                          :to      => tokens[2],
                          :subject => 'Contact Info',
                          :html  =>  '''
                                     <html>
                                    <head></head>
                                    <body>
                                      <p>---------------ContactInfo-----------<br></p>
                                      <p> Username :' "" + usrlist[0] + "" '
                                      <p> Name :' "" + usrlist[1] + "" '</p>
                                      <p>Email :' "" + usrlist[2] + "" '</p>
                                      <p>Identity Card :' "" + usrlist[3] + "" '</p>
                                      <p>Birth Date : ' "" + usrlist[4] + "" '</p>
                                      <h2>Profile picture</h2>
                                      <img src=' "" + usrlist[5] + "" ' style=width:128px;height:128px; >
                                    </body>
                                   </html>
                                     ''' }
        mg_client.send_message 'sandbox001786de44a44eec898cd90610e9097d.mailgun.org', message_params
        connection.write 'Yes'
end
}
end
  iniciateServer
end