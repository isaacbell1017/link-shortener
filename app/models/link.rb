require 'securerandom'

class Link < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: [:slugged, :history, :finders]

  paginates_per 50

  before_save :generate_slug
  before_save :ensure_protocol

  validates_presence_of :full_url
  validates_uniqueness_of :slug

  def increment_clicked_count
    stat_clicked_count += 1
  end

  def ensure_protocol
    self.full_url = "http://#{self.full_url}" unless self.full_url.start_with?('http')
  end

  def generate_slug
    self.slug = SecureRandom.hex(7) if self.slug.blank?
  end

  # Shortened URL path to display in views
  def path
    "s/#{slug}"
  end
end
