class Host < ActiveRecord::Base
  # Remember to create a migration!
  has_many :parties
end
