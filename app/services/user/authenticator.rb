class User::Authenticator
  def initialize(user)
    @user = user
  end

  def authenticate(raw_password)
    @user &&
      @user.hashed_password &&
      @user.start_date <= Date.today &&
      (@user.end_date.nil? || @user.end_date > Date.today) &&
      BCrypt::Password.new(@user.hashed_password) == raw_password

  end
end
