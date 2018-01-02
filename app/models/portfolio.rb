class Portfolio < ApplicationRecord
  include Placeholder

  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.react
    where(subtitle: "React")
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails")}

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '700', width: '400', color: 'ffa')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200', color: 'ffa')
  end

end
