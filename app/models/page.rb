class Page < ApplicationRecord
  belongs_to :subject, optional: true
  has_many :sections
  has_and_belongs_to_many :admin_users
  scope :visible, -> { where(visible: true) }
  scope :invisible, -> { where(visible: false) }
  scope :sorted, -> { order('position ASC') }
  scope :newest_first, -> { order('created_at DESC') }
  scope :search, -> (query) {where(['name LIKE ?', "%#{query}%"]) }

  validates_presence_of :name
  validates_length_of :name, maximum: 255
  validates_presence_of :permalink
  validates_length_of :permalink, within: 3..255
  validates_uniqueness_of :permalink
end
