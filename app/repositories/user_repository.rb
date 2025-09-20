class UserRepository
    def email_exists?(email)
        User.exists?(email: email.downcase)
    end

    def email_exists_excluding_id?(email, excluded_at)
        User.where(email: email.downcase).where.not(id: excluded_at).exists?
    end

    def user_exists?(user_id)
        User.where(id: user_id).exists?
    end
end