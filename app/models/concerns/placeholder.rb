module Placeholder
  extend ActiveSupport::Concern

  def self.image_generator(height:, width:, color:)
    "http://via.placeholder.com/#{height}x#{width}/#{color}"
  end
end
