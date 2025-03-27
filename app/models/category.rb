class Category < ApplicationRecord
  validates :name,
            presence: { message: "กรุณาระบุชื่อหมวดหมู่" },
            uniqueness: { message: "ชื่อหมวดหมู่นี้ถูกใช้งานแล้ว" },
            length: { maximum: 50, message: "ชื่อหมวดหมู่ต้องไม่เกิน 50 ตัวอักษร" },
            format: { with: /\A[ก-๙a-zA-Z\s]+\z/, message: "ชื่อหมวดหมู่ต้องเป็นตัวอักษรเท่านั้น" }

  before_save :normalize_name

  private

  def normalize_name
    self.name = name.strip if name.present?
  end
end
