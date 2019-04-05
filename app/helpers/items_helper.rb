module ItemsHelper

    def author_own(item)
        logged_in? && current_user.id = item.user
    end
    
end
