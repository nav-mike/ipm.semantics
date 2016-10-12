class Project < ActiveRecord::Base
  has_many :projects_publications
  has_many :publications, through: :projects_publications

  has_many :people_projects
  has_many :people, through: :people_projects

  serialize :keywords, JSON
end
