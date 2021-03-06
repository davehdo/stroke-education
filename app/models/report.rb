class Report
  include Mongoid::Document
  include Mongoid::Timestamps

  has_and_belongs_to_many :parts
  has_many :messages
  
  belongs_to :creator, class_name: "User"
  
  field :initials, type: String
  field :link_delivered_at, type: DateTime
  field :accessed_at, type: Array
  field :keys, type: Array
  
  before_save :generate_keys
    
  def generate_keys(n_digits = 16)
    o = [('a'..'z'), ('A'..'Z'), 1..9].map(&:to_a).flatten
    self.keys ||= (1..5).collect {|n| (0...n_digits).map { o[rand(o.length)] }.join}
  end
  
  def record_access
    update_attribute :accessed_at, ((self.accessed_at || []) + [Time.now])
  end
end
