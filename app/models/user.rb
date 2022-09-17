class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :password, :password_confirmation, presence: true
  validates :password, :password_confirmation, length: {minimum:8, maximum:24}

  def random_name
    return pseudo_name if self.pseudo_name

    first = %w(curious pretty cool awesome charming upbeeat diligent creative bright amiable friendly likable polite)
    last = %w(panda aardvark lion tiger albatros eagle badger batsshark lion bison buffalo giraffe rhino elephant leopard tiger)
    
    self.pseudo_name = "#{first.sample}_#{last.sample}_#{rand(0..1000)}"
    return self.pseudo_name
  end
end
