class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :trackable, :validatable

  #Model Attributes
  #@email
  #@password
  
  #email and password have built in validations with devise
end
