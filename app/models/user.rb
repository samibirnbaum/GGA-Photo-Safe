class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :trackable, :validatable
  
  #Associations
  has_many :important_photos

  #Model Attributes
  #@email
  #@password
  
  #email and password have built in validations with devise
end
