class Restaurant < ApplicationRecord
  mount_uploader :picture_url, PictureUrlUploader

  # Direct associations

  has_many   :events,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
