class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  
  has_many :papers
  has_one :payment_detail
  has_one :journal
  has_one :journalpayment
  # has_one :verification
  validates_presence_of :first_name, :last_name, :mobile_number, :college_name, :designation
  validates :mobile_number, uniqueness: true

  def needs_mobile_number_verifying?
    if is_verified
      return false
    end
    if mobile_number.empty?
      return false
    end
    return true
  end

end
