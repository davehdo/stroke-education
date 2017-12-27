class Part
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :section, type: String
  field :text, type: String
end
