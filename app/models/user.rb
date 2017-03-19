class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # has_manyメソッドでは何も指定しなくても主キーをidカラム、外部キーを関係させるモデル_idに指定する。
  # 今回は関係させるモデルがuserであるため、user_idになる。
  has_many :blogs
         
end
