require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  def self.authenticate(username:, password:)
    user = find_by(username: username)
    print user
    return nil if user.nil?
    return nil if user.password != password
    user
  end

  def password
   @password ||= Password.new(password_hash)
 end

 def password=(new_password)
   @password = Password.create(new_password)
   self.password_hash = @password
 end

end
