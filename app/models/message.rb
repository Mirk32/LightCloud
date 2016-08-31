class Message < ActiveRecord::Base
  acts_as_tree order: 'created_at DESC' #we need to tell our model that it should be nested.

  belongs_to :user
end
