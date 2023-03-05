# == Schema Information
#
# Table name: body_parts
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class BodyPart < ApplicationRecord
  has_many(:userss, { :through => :users, :source => :user })
  has_many(:stretches, { :class_name => "Stretch", :foreign_key => "body_part_id", :dependent => :destroy })
  has_many(:users, { :class_name => "UserBodyPart", :foreign_key => "body_part_id", :dependent => :destroy })
end
