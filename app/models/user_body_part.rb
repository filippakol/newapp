# == Schema Information
#
# Table name: user_body_parts
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  body_part_id :integer
#  user_id      :integer
#
class UserBodyPart < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:body_part, { :required => true, :class_name => "BodyPart", :foreign_key => "body_part_id" })
end
