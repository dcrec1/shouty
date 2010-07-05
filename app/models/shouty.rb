class Shouty < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :body
  default_scope order('id DESC')
end
