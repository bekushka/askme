class Question < ApplicationRecord

  belongs_to :user

  validates :text, user, presence: true

  #демонстрация жизненного цикла объекта
  #навесили на все популярные коллбэки свои методы
  #before_validation :before_validation
  #after_validation :after_validation
  #before_save :before_save
  #before_create :before_create
  #after_create :after_create
  #after_save :after_save

  #before_update :before_update
  #after_update :after_update

  #before_destroy :before_destroy
  #after_destroy :after_destroy


end
