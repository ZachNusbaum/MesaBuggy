class Ahoy::Visit < ApplicationRecord
  self.table_name = "ahoy_visits"

  has_many :events, class_name: "Ahoy::Event"
  belongs_to :user, optional: true

  def visitor_visits
    self.class.where(visitor_token: visitor_token)
  end

  def visitor_total_visits_count
    visitor_visits.count
  end

end
