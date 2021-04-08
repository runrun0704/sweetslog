class Post < ApplicationRecord
  validates :content_1, {presence:true}
  validates :content_2, {presence:true}
  
  has_one_attached :image

  def user
    return User.find_by(id: self.user_id)
  end
    
  def self.search(search)
    if search
      Post.where(['title LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end
end
