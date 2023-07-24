class User < ApplicationRecord
  include WorkspaceInitializable

  # Allow only a single role assignment.
  rolify before_add: :remove_existing_roles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :assign_default_role

  belongs_to :last_viewed_workspace, class_name: "Workspace", optional: true

  has_many :workspaces,   as: :owner, dependent: :destroy
  has_many :sticky_notes, as: :owner, dependent: :destroy

  validates :name, presence: true
  validate :role_assigned, on: :update

  def role
    roles_name.first.to_sym
  end

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
