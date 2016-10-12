class Publication < ActiveRecord::Base
  has_many :people_publications
  has_many :people, through: :people_publications

  has_many :projects_publications
  has_many :projects, through: :projects_publications
end
