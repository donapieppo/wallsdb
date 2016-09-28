class Admin < ActiveRecord::Base
  belongs_to :user
  belongs_to :wall

  def to_s
    self.user.to_s
  end

  def email
    self.user_id ? self.user.email : ''
  end
end

