class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Deviseには、configure_permitted_parametersという専用のストロングパラメータを設定するメソッドがあります
  before_action :configure_permitted_parameters, if: :devise_controller?

  #変数PERMISSIBLE_ATTRIBUTESに配列[:name]を代入
  PERMISSIBLE_ATTRIBUTES = %i(name)

  # ※protectedとprivateについて
  # private内に記述されているメソッドはクラス外から呼び出すことができませんが、protected内のメソッドは呼び出すことができます。
  # protected内にメソッドを記述することで、思わぬところからメソッドが呼び出されることを防ぎます。
  protected
  
  # deviseのストロングパラメーターにカラム追加するメソッドを定義
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSIBLE_ATTRIBUTES)
    devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES)
  end
end
