class Box < ApplicationRecord
  has_many :items

  validates :tag, format: { with: /\A[\h]{8}\z/ }, uniqueness: true

  enum kind: {
    freshly: 0,
    amazon:  1,
    uhaul:   2,
    other:   3
  }

  before_validation :set_tag

  def display_tag
    tag.split('').each_slice(4).map { |s| s.join('') }.join('-')
  end

  private

  def set_tag
    self[:tag] ||= SecureRandom.uuid.split('-').first.upcase
  end
end
