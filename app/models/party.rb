class Party < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :host
end
