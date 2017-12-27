class Part
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :section, type: String
  field :description_text, type: String
  field :goals_text, type: String
end
