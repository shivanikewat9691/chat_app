class User < ApplicationRecord
	before_create :generate_pin_and_valid_date
  before_create :generate_token
  has_one_attached :image 


  def generate_pin_and_valid_date
    self.pin         = rand(1_000..9_999)
    self.valid_until = Time.current + 5.minutes
  end

  # def verify_pin(entered_pin)
  #   return false if valid_until < Time.current
  #   return pin.to_s == entered_pin.to_s
  # end

  def generate_token
    self.token = SecureRandom.hex(20)
  end

  # def user_mobile_number
  #   self.account.full_phone_number
  # end

end
