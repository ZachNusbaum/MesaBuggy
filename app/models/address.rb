class Address < ApplicationRecord
  belongs_to :user
  has_secure_token

  validates :zip_code, postal_code: true

  before_save :parse_zip_code

  private

  def parse_zip_code
    if zip_code_changed?
      parsed_zip = Postjoy.find(zip_code)
      if parsed_zip
        self.latitude = parsed_zip[:latitude]
        self.longitude = parsed_zip[:longitude]
      end
    end
  end
end
