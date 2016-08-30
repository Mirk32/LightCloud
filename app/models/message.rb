class Message < ActiveRecord::Base
  belongs_to :user

  #validate :content, presence: true, format: { with: /123/}
end
