class Report
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :parts
  
  field :initials, type: String
  field :link_delivered_at, type: DateTime
  field :accessed_at, type: DateTime
  field :key, type: String
  
  before_save :generate_key
  
  
  def generate_key
    self.key ||= (0...16).map { (65 + rand(26)).chr }.join
  end
end
