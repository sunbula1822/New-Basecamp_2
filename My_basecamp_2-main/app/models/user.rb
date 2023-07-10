class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :comments, dependent: :destroy
         has_many :projects, dependent: :destroy


         def self.find_for_database_authentication(warden_conditions)
          conditions = warden_conditions.dup
          if (email = conditions.delete(:email))
            where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => email.downcase }]).first
          elsif conditions.has_key?(:username) || conditions.has_key?(:email)
            where(conditions.to_h).first
          end
        end
        validates :email, presence: true
        validate :validate_username

def validate_username
  if User.where(email: username).exists?
    errors.add(:username, :invalid)
  end
end
end
