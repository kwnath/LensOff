class Lense < ApplicationRecord
  validates :name, presence: true
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

  # acts_as_taggable_on :mount, :min_aperture, :max_aperture

  # def mount_type
  #   mount
  # end

  # def min_ap
  #   min_aperture_list.reduce.to_i
  # end

  # def max_ap
  #   max_aperture_list.reduce.to_i
  # end

  # def in_aperture_range?(number)
  #   number.between? min_ap, max_ap
  # end

  # def self.in_aperture_range(number)
  #   lenses = Lense.all

  #   lenses.select { |lense| lense.in_aperture_range?(number) }

  # end



end
