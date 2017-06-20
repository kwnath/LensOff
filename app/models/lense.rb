class Lense < ApplicationRecord
  # t.string   "name"
  # t.text     "description"
  # t.integer  "price"
  # t.string   "condition"
  acts_as_taggable_on :mount, :min_aperture, :max_aperture

  def mount_type
    mount
  end

  def min_ap
    min_aperture_list.reduce.to_i
  end

  def max_ap
    max_aperture_list.reduce.to_i
  end

  def in_aperture_range?(number)
    number.between? min_ap, max_ap
  end

  def self.in_aperture_range(number)
    lenses = Lense.all

    lenses.select { |lense| lense.in_aperture_range?(number) }

  end



end
