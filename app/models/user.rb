class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  belongs_to :raffle

  validates_format_of :email, with: Devise.email_regexp
  validates_presence_of :password, on: :create
  validates_confirmation_of :password, on: :create
  validates_length_of :password, within: Devise.password_length
  validate :valid_with_raffle, on: :create

  def valid_with_raffle
    if User.where(email: email, raffle_id: raffle_id).exists?
      errors.add(:raffle, 'already exits')
    end
  end
end
