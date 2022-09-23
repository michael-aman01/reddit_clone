# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  moderator   :boolean          not null
#  title       :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Sub < ApplicationRecord
  validates :user_id, :title, presence: true
  validates_uniqueness_of :title


  
   
belongs_to :moderator,
    class_name: :User,
    foreign_key: :user_id

  has_many :posts, as: :postables, dependent: :destroy
                         


end
