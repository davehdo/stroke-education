class Part
  include Mongoid::Document
  include Mongoid::Timestamps

  has_and_belongs_to_many :reports
  
  field :name, type: String
  field :section, type: String
  field :description_text, type: String
  field :goals_text, type: String
  
  def self.section_names
    ["intro", "medications", "risk factors", "testing", "next steps"]
  end
end
