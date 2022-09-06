# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def edit
      authorize @user
      super
    end

    # PUT /resource
    def update
      authorize @user
      super
    end

    # DELETE /resource
    def destroy
      authorize @user
      super
    end
  end
end
