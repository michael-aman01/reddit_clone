# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  title         :string           not null
#  url           :string
#  content       :text
#  postable_type :string
#  postable_id   :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Post < ApplicationRecord
  belongs_to :postable, polymorphic: true


end
