class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :validatable
    
  def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_create do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.username = auth.info.nickname
      end
  end
end
