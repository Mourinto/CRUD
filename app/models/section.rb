class Section < ApplicationRecord
  belongs_to :page, optional: true
  has_many :section_edits
  has_many :admin_users, :through => :section_edits
  scope :visible, -> { where(visible: true) }
  scope :invisible, -> { where(visible: false) }
  scope :sorted, -> { order("position ASC") }
  scope :newest_first, -> { order("created_at DESC") }
  scope :search, -> (query) {where(["name LIKE ?", "%#{query}%"]) }

  content_type = ['text', 'HTML']

  #validates_presence_of :name
  #validates_length_of :name, maximum: 255
 # validates_inclusion_of :content_type, in: content_type, message: "must be one of: #{content_type.join(', ')}"
 # validates_presence_of :content

end
