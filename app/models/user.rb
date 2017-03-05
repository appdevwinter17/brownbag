class User < ApplicationRecord
  mount_uploader :profile_picture, ProfilePictureUploader

  # Direct associations

  has_many   :invitations,
             :dependent => :destroy

  has_many   :events,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  # Indirect associations

  has_many   :attended_events,
             :through => :invitations,
             :source => :event

  has_many   :commented_events,
             :through => :comments,
             :source => :event

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
