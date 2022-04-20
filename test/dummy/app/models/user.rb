# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  country    :string
#  age        :integer
#  role       :string
#  salary     :integer
#  dob        :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
end
