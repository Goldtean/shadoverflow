class Vote < ActiveRecord::Base
  # Remember to create a migration!

  #User can only vote on a question once
  validates :user_id, uniqueness: { scope: :votable_id }


  belongs_to :user
  belongs_to :votable, :polymorphic => true
end
