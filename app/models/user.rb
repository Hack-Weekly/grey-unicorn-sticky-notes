class User < ApplicationRecord
  # Allow only a single role assignment.
  rolify before_add: :remove_existing_roles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :assign_default_role

  has_many :comments, dependent: :destroy
  has_many :sticky_notes, dependent: :destroy

  validates :name, presence: true
  validate :role_assigned, on: :update

  def first_name
    name.split.first
  end

  def last_name
    name.split.last
  end

  private

  def remove_existing_roles(role)
    roles.delete_all
  end

  def assign_default_role
    add_role(:registered) if roles.blank?
  end

  def role_assigned
    errors.add(:roles, "must be assigned a role") unless roles.any?
  end
end
