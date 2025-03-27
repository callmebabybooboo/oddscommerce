class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "รูปแบบอีเมลไม่ถูกต้อง" }

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= "user"
  end

  def admin?
    role == "admin"
  end

  def user?
    role == "user"
  end
end
