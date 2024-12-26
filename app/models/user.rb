class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders

  def send_new_password
    new_password = Devise.friendly_token.first(8) # Генерация нового пароля
    self.password = new_password
    self.password_confirmation = new_password
    save # Сохранение нового пароля в базе данных
    UserMailer.send_new_password(self, new_password).deliver_now # Отправка письма
  end

  def cart_items
    # Предположим, что у вас есть модель CartItem, связанная с User
    CartItem.where(user_id: id)
  end
end
