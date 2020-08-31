# (c) goodprogrammer.ru

# Модель вопроса.
class Question < ActiveRecord::Base
  belongs_to :user

  validates :user, :text, presence: true
  validates :text, presence: true, length: { maximum: 255 }
end
