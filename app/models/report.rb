class Report
  include Mongoid::Document
  include Mongoid::Timestamps

  has_and_belongs_to_many :parts
  
  field :initials, type: String
  field :link_delivered_at, type: DateTime
  field :accessed_at, type: DateTime
  field :key, type: String
  
  before_save :generate_key
    
  def generate_key(n_digits = 32)
    o = [('a'..'z'), ('A'..'Z'), 1..9].map(&:to_a).flatten
    self.key ||= string = (0...n_digits).map { o[rand(o.length)] }.join
    

  end
end
