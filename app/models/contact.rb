class Contact < ApplicationRecord
  belongs_to :user


  VALID_EMAIL_REGEX = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i


  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true,uniqueness: { case_sensetive: false }
  validates :email, format: { with: VALID_EMAIL_REGEX, multiline: true }


end
