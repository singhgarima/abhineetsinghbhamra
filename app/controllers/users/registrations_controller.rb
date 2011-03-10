class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :authenticate, :only => [:new]
  prepend_before_filter :set_resource, :only => [:new]

  private

  def set_resource
    resource = "user"
  end
end
