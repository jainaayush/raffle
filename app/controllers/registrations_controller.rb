class RegistrationsController < Devise::RegistrationsController
  def create
    super
    flash[:notice] = "Thanks for signing up! Your odds of winning are #{100/User.count}"
  end
end
