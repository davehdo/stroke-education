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
  
  # beware that changing this may dissociate parts with the correct sections of the report
  def self.section_names
    ["intro", "risk factors", "medications", "testing", "followup"]
  end
  
  # link each section name with an anchor name, but use
  # short anchors so can get short URLs
  def self.section_names_to_anchors
    {
      "intro" => "i", 
      "risk factors" => "r", 
      "medications" => "rx", 
      "testing" => "dx", 
      "followup" => "f"
    }
  end
  
  
  validate :ensure_has_name_or_annotation
  
  
  def ensure_has_name_or_annotation
    unless self.name.present? or self.annotation.present?
      self.errors.add(:name, "or annotation must be present")
    end
  end
end
