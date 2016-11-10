class Course < ActiveRecord::Base
  include Bootsy::Container
  has_many :course_tags
end
