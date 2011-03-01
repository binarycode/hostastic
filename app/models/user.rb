class User < ActiveRecord::Base
  has_many :tickets
  has_many :replies
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  def to_s
    email
  end
end
