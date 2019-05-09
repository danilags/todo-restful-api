class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_many :todos, foreign_key: :created_by

  # Validation
  validation_presence_of :name, :emai, :password_digest
end
