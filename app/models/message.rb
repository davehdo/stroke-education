class Message
  include Mongoid::Document
  field :text, type: String
  field :recipient, type: String
  field :message_category, type: Integer
  belongs_to :report
  
  def self.prototypes
    [  
      {description: "Day 0", category: 1, text: "Please click here to find your personalized stroke app [URL]"},
      {description: "Day 1", category: 2, text: "Please click here to review your stroke prevention medications"},
      {description: "Day 4", category: 3, text: "Please click here to review the cause of your stroke"},
      {description: "Day 7", category: 4, text: "Please click here to review your stroke risk factors"},
      {description: "Day 10", category: 5, text:  "Do you have an appointment to see your primary doctor? if not, please call to schedule a visit. It is important to see your primary doctor to discuss changes that happened while you were in the hospital."}, 
      {description: "Day 11", category: 6, text:  "Do you have an appointment with a neurologist? if not, Please call 215-662-3606 to schedule your appointment with Dr. ____"}
    ]
  end
end
