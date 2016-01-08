class UrlResource < ActiveRecord::Base
  validates :url, uniqueness: true, null: false
end
