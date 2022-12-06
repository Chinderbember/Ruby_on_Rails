# frozen_string_literal: true

module Admin
  class UsersController < Admin::ApplicationController
    before_action :set_admin_user, only: %i[edit update destroy toggle]
    # GET /admin/users or /admin/users.json
    def index
      authorize [:admin, User]
      @admin_users = policy_scope(
        User,
        policy_scope_class: Admin::UserPolicy::Scope
      ).includes(:role, :events, :items, :comments).page(params[:page]).per(5)
    end

    # GET /admin/users/new
    def new
      authorize [:admin, User]
      @admin_user = User.new
    end

    # GET /admin/users/1/edit
    def edit; end

    # POST /admin/users or /admin/users.json
    def create
      authorize [:admin, User]
      @admin_user = User.new(admin_user_params)

      saving_process
    end

    # PATCH/PUT /admin/users/1 or /admin/users/1.json
    def update
      respond_to do |format|
        if @admin_user.update(admin_user_params)
          format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: admin_users_path }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @admin_user.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/users/1 or /admin/users/1.json
    def destroy
      @admin_user.destroy
      render json: {}
    end

    def toggle
      @admin_user.update(active: !@admin_user.active)
      render json: {}
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = authorize [:admin, User.find(params[:id])]
    end

    # Only allow a list of trusted parameters through.
    def admin_user_params
      params.require(:user).permit(:name, :email)
    end

    def saving_process
      respond_to do |format|
        if @admin_user.save
          format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: admin_users_path }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @admin_user.errors, status: :unprocessable_entity }
        end
      end
    end
  end
end
