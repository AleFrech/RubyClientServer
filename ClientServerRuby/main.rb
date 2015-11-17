require_relative 'Client'
require_relative 'User'
require_relative 'Validations'


class Main
  while true
    puts('---------------MENU--------------------')
    puts('1) Add User')
    puts('2) Show User')
    puts('3) Delete User')
    puts('4) Send user to Email')
    puts('5) Exit...')
    puts('')
    puts 'Ingrese una opcion: '
    p = Integer(gets.chomp)
    case p
      when 1
        puts 'Enter name:'
        name = gets.chomp
        puts 'Enter Username :'
        usr = gets.chomp
        puts 'Enter Email:'
        email = gets.chomp
        puts 'Enter Identity Numbre:'
        cedula = gets.chomp
        puts 'Enter BirthDate:'
        date = gets.chomp
        puts 'Enter Img Url: '
        img = gets.chomp
        c=Validations.VerifyCedula cedula
        d=Validations.VerifyDate date
        u=Validations.VerifyUser usr
        e=Validations.VerifyEmail email
        if c !=1
          puts 'Identity number not valid!!! '
        end
        if d !=1
          puts 'BirthDate not valid!!! '
        end
        if u !=1
          puts 'Username  already taken!!!'
        end
        if e!=1
          puts 'Email not valid or is already taken!!! '
        end
        if c==1 && d ==1 && u==1 && e==1
          user= ::User. new(usr,name,email,cedula,date,img)
          res=Client.iniciateClient user.to_s+'\n'+'Add'
          if res.eql?'Yes'
            puts 'Username succesfully added!!! '
          else
            puts 'Error User not added!!!!'
          end
        end
       when 2
         puts 'Enter the Username to display: '
         usrname = gets.chomp
         usrname+='\n'+'ShowUser'
         res=Client.iniciateClient usrname
        if res!='NO'
          tokens = res.split(',')
          puts('----User Info--------')
          puts('Username : '+tokens[0])
          puts('Name : '+tokens[1])
          puts('Email : '+tokens[2])
          puts('Identity Card : '+tokens[3])
          puts('Birth Date  : '+tokens[4])
        else
          puts('Not such user in our database')
        end
      when 3
        puts 'Enter the Username to display: '
        usrname = gets.chomp
        usrname+='\n'+'DeleteUser'
        res=Client.iniciateClient usrname
        if res.eql?'YES'
          puts 'User succesfully deleted!!!'
        else
          puts 'Error User dosent exist!!!!'
        end
      when 4
        puts 'Enter username to send to your email: '
        usrname = gets.chomp
        puts 'Enter your email: '
        email= gets.chomp
        usrname += '\n'+'SendEmail'
        usrname +='\n'+email
        res=Client.iniciateClient usrname
        if res.eql?'Yes'
          puts 'Email sent  succesfully !!! '
        else
          puts 'Email not send error!!!'
        end
      when 5
         break
    end
  end
end