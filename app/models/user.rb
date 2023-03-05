# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_many(:body_parts, { :through => :user_body_parts, :source => :body_part })
  has_many(:bookmarks, { :class_name => "Bookmark", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:user_body_parts, { :class_name => "UserBodyPart", :foreign_key => "user_id", :dependent => :destroy })
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
