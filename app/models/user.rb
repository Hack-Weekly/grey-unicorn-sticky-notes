class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :assign_default_role

  has_many :comments, dependent: :destroy
  has_many :sticky_notes, dependent: :destroy

  validates :name, presence: true
  validate :must_have_a_role, on: :update

  def first_name
    name.split.first
  end

  def last_name
    name.split.last
  end

  private

  def assign_default_role
    add_role(:registered) if roles.blank?
  end

  def must_have_a_role
    errors.add(:roles, "must have at least one role") unless roles.any?
  end
end
