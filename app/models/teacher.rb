class Teacher < ApplicationRecord
  belongs_to :subject

  validates_presence_of :name, :message=> "Enter Name"
  validates_presence_of :email, :message=> "Enter email"
  validates_presence_of :phone, :message=> "Enter phone number"

	
	before_save do
    user = User.create(email: self.email, password: 'password', password_confirmation: 'password', role: 'teacher')
  	user.add_role :teacher
  end  
end
