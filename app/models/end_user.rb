class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum sex:    [ :male, :female, :other ]

  has_many :mylists, dependent: :destroy
  has_many :mylist_tracks, through: :mylists, source: :track

  # フォロー機能
  has_many :relationships
  # ↑↑ has_many :relationships, foreign_key: 'user_id'
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :end_user
  has_many :posts

  def follow(other_end_user)
    unless self == other_end_user # フォローする対象が自分じゃない時
      self.relationships.find_or_create_by(follow_id: other_end_user.id) # そのユーザーのidを参照してfollowを作成
    end
  end

  def unfollow(other_end_user)
    relationship = self.relationships.find_by(follow_id: other_end_user.id) # フォローしているユーザーを探す
    relationship.destroy if relationship # フォローして入れば（relationshipが存在すれば）relationshipを削除（フォローを外す）
  end

  def following?(other_end_user)
    self.followings.include?(other_end_user) #
  end

  def self.search(search)
      if search
        EndUser.where(['content LIKE ?', "%#{search}%"])
      else
        EndUser.all
      end
    end
end
