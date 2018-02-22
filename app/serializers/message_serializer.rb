class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text, :recipient, :message_category
  has_one :report
end
