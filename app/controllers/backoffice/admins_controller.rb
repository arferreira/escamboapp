class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new params_admin
    if @admin.save
      redirect_to backoffice_admins_path, notice: "O Administrador #{@admin.email} foi criado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    passwd = params[:admin][:password]
    passwd_confirmation = params[:admin][:password_confirmation]

    if passwd.blank? && passwd_confirmation.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end

    if @admin.update params_admin
      redirect_to backoffice_admins_path, notice: "O Administrador #{@admin.email} foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
  if @admin.destroy
    redirect_to backoffice_admins_path, notice: "O Administrador #{@admin.email} foi deletado com sucesso!"
  else
    render :index, notice: "Houve um erro ao apagar o administrador"
  end
  end

  private
  def set_admin
    @admin = Admin.find_by(id: params[:id])
  end

  def params_admin
    params.require(:admin).permit(:email, :name, :role, :password, :password_confirmation)
  end
end
