class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:register, :login]

  def register
    user = User.new(user_params)

    if user.save
      render json: { message: 'User created successfully', code: 200 }
    else
      render json: { errors: user.errors.full_messages, code: 400 }
    end
  end

  def login
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      token = generate_jwt(user)
      render json: { token: token, code: 200 }
    else
      render json: { error: 'Invalid email or password', code: 400 }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :phone, :status)
  end

  def generate_jwt(user)
    payload = { user_id: user.id, exp: 24.hours.from_now.to_i }
    JWT.encode(payload, Rails.application.secret_key_base)
  end
end
