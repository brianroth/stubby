class Link < ApplicationRecord
  after_create :generate_slug
  validates :url, presence: true, length: { maximum: 1024 }

  def short_url
    if new_record?
      nil
    else
      Rails.configuration.base_url + slug
    end
  end

  private

  def generate_slug
    self.slug = id.to_s(36)
    save
  end
end
