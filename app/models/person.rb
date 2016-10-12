class Person < ActiveRecord::Base
  has_many :people_projects
  has_many :people, through: :people_projects

  has_many :people_publications
  has_many :publications, through: :people_publications
end
