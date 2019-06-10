class Faq < ActiveRecord::base
  validates_presence_of :question, :answer

end