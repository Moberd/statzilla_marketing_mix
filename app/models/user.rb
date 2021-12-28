class User < ApplicationRecord
  has_many :xls_forms
  validates :email, presence: true, :format => { :with => /.+@.+\z/ }, :allow_blank => false
end
