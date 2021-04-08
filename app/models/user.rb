class User < ApplicationRecord
    validates :name, {presence:true, length:{maximum:8}, uniqueness:true}
    validates :password, {presence:true}

    def posts
        return Post.where(user_id:self.id)
    end
end
