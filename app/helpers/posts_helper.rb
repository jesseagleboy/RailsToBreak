module PostsHelper
    def post_for_logged_in_user(post, current_user)
        if current_user.nil?
            return false
        end
        
        if post.user_id == current_user.id
            return true
        else
            return false
        end
    end
end
