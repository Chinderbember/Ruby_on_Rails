# frozen_string_literal: true

module Admin
  class RolesController < Admin::ApplicationController
    before_action :set_admin_role, only: %i[edit update destroy]

    # GET /admin/roles or /admin/roles.json
    def index
      authorize [:admin, Role]
      @admin_roles = policy_scope(Role,
                                  policy_scope_class: Admin::RolePolicy::Scope).page(params[:page]).per(5)
    end

    # GET /admin/roles/new
    def new
      authorize [:admin, Role]
      @admin_role = Role.new
    end

    # GET /admin/roles/1/edit
    def edit; end

    # POST /admin/roles or /admin/roles.json
    def create
      authorize [:admin, Role]
      @admin_role = Role.new(admin_role_params)

      saving_process
    end

    # PATCH/PUT /admin/roles/1 or /admin/roles/1.json
    def update
      respond_to do |format|
        if @admin_role.update(admin_role_params)
          format.html { redirect_to admin_roles_path, notice: 'Role was successfully updated.' }
          format.json { render :show, status: :ok, location: admin_roles_path }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @admin_role.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/roles/1 or /admin/roles/1.json
    def destroy
      @admin_role.destroy

      respond_to do |format|
        format.html { redirect_to admin_roles_path, notice: 'Role was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_admin_role
      @admin_role = authorize [:admin, Role.find(params[:id])]
    end

    # Only allow a list of trusted parameters through.
    def admin_role_params
      params.require(:role).permit(:name, :code)
    end

    def saving_process
      respond_to do |format|
        if @admin_role.save
          format.html { redirect_to admin_roles_path, notice: 'Role was successfully created.' }
          format.json { render :show, status: :created, location: admin_roles_path }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @admin_role.errors, status: :unprocessable_entity }
        end
      end
    end
  end
end
