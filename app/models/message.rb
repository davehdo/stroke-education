class Message
  include Mongoid::Document
  field :text, type: String
  field :recipient, type: String
  field :message_category, type: Integer
  embedded_in :report
end
