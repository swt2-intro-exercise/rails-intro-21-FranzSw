class Author < ApplicationRecord
  has_and_belongs_to_many :papers

  validates :last_name, presence: true, length: { minimum: 2 }
  validates :first_name, presence: true

  def name
    return "#{first_name} #{last_name}"
  end
end
