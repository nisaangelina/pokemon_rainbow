class Skill < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :power, numericality: { greater_than_or_equal_to: 1 }
  validates :max_pp, numericality: { greater_than_or_equal_to: 1 }
end
