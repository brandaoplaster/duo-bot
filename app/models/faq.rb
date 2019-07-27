require 'pg_search'

class Faq < ActiveRecord::Base
  include PgSearch
  
  validates_presence_of :question, :answer

  has_many :faq_hashtags
  has_many :hashtags, through: :faq_hashtags
end