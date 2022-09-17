class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #validation
  validates :email, :password, :password_confirmation, presence: true
  validates :password, :password_confirmation, length: {minimum:8, maximum:24}

  before_save :random_name

  #associations
  has_many :messages, dependent: :destroy
  has_many :visited_taverns, class_name: "TavernMember"
  has_one :owned_tavern, class_name: "Tavern", foreign_key: "user_id"

  
  private
  def random_name
    return pseudo_name if self.pseudo_name

    first = %w(curious pretty cool awesome charming upbeat diligent creative bright amiable friendly likable polite stunning)
    last = %w(panda aardvark lion tiger albatros eagle badger batsshark lion bison buffalo giraffe rhino elephant leopard tiger)
    color = %w(6 7 8 9 a b c d)
    display_color = ["#"]
    6.times do 
      display_color << color.sample
    end
    
    self.update!(color: display_color.join(''), pseudo_name: "#{first.sample}_#{last.sample}_#{rand(0..1000)}" )
    return self.pseudo_name
  end
end
