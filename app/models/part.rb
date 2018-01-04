class Part
  include Mongoid::Document
  include Mongoid::Timestamps

  has_and_belongs_to_many :reports
  
  field :name, type: String
  field :annotation, type: String # hidden from the end user
  field :section, type: String
  field :description_text, type: String
  field :goals_text, type: String
  field :is_checked_by_default, type: Boolean, default: false
  field :embedded_html, type: String
  
  def self.section_names
    ["intro", "risk factors", "medications", "testing", "followup"]
  end
end
