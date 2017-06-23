class Lense < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :condition, presence: true
  validates :brandname, presence: true
  validates :aperture_min, presence: true, numericality: { only_integer: true, less_than_or_equal_to: :aperture_max }
  validates :aperture_max, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: :aperture_min }
  validates :focal_length_min, presence: true, numericality: { only_integer: true, less_than_or_equal_to: :focal_length_max }
  validates :focal_length_max, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: :focal_length_min }
  validates :image_stabilization, presence: true
  validates :mount_type, presence: true
  validates :camera_type, presence: true
  has_attachments :photos, maxiumum: 5
  belongs_to :user
  scope :camera_type, -> (camera_type) { where camera_type: camera_type }
  scope :brandname, -> (brandname) { where brandname: brandname }
  scope :mount_type, -> (mount_type) { where brandname: mount_type }
  scope :condition, -> (condition) { where condition: condition }
  scope :image_stabilization, -> (name) { where image_stabilization: name }
  scope :aperture_min, -> (min) { where( "aperture_min > ?", min )}
  scope :aperture_max, -> (max) { where( "aperture_max < ?", max )}


  scope :reserved, -> { User.joins(:lenses).where("lenses.id is not null") }
  # has_many :user, through: :reserved, source: "lenses"
  # Users reserved lenses
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
