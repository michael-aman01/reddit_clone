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
  belongs_to :user
end
