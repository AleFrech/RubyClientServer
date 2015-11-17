class Client

  def self.iniciateClient str
    require 'socket'
    s = TCPSocket.new('127.0.0.1', 3333)
    s.write str

    return  s.recv(1024).to_s

  end
end