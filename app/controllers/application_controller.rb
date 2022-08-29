class ApplicationController < ActionController::Base

  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる前に
  # configure_permitted_parametersメソッドが実行され
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後の遷移先、after_sign_in_path_forはDeviseが用意しているメソッド
  def after_sign_in_path_for(resource)
    post_images_path
  end

  # サインアウト後の遷移先、after_sign_out_path_forはDeviseが用意しているメソッド
  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  # ストロングパラメータと同様の機能
    # privateは記述をしたコントローラ内でしか参照できません
    # 一方、protectedは呼び出された他のコントローラからも参照することができる。

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

  end
end


