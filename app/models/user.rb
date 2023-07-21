class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :comments, dependent: :destroy
  has_many :sticky_notes, as: :author, dependent: :destroy
  has_many :roles, dependent: :destroy

  validates :name, presence: true

  def first_name
    name.split.first
  end

  def last_name
    name.split.last
  end
end
