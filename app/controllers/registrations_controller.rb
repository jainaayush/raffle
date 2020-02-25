class RegistrationsController < Devise::RegistrationsController
  def create
    super
    flash[:notice] = "Thanks for signing up! Your odds of winning are #{@user.winning_percentage}%"
  end
end
