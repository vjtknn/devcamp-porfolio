class Topic < ApplicationRecord
  has_many :posts
  validates_presence_of :title


  def self.with_blogs
    includes(:posts).where.not(posts: {id: nil})
  end
end
