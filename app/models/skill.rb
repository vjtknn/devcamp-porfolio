class Skill < ApplicationRecord
  validates_presnece_of :title, :percent_utilized
end
