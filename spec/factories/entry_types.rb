# == Schema Information
#
# Table name: entry_types
#
#  id         :bigint           not null, primary key
#  key        :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_entry_types_on_key  (key) UNIQUE
#
FactoryBot.define do
  factory :entry_type do
    
  end
end
