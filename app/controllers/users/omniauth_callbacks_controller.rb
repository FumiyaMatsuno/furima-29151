class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
  authorization
  end

  def google_oauth2
  authorization
  end

  private

  def authorization
    sns_info = User.from_omniauth(request.env["omniauth.auth"])
    # ＠userへ代入する際にハッシュから値を取り出す
    @user = sns_info[:user]

    if @user.persisted? #ユーザー情報が登録済みなので、新規登録ではなくログイン処理を行う
      sign_in_and_redirect @user, event: :authentication
    else #ユーザー情報が未登録なので、新規登録画面へ遷移する
      # ＠sns_idという変数を作り、新規登録画面で扱えるようにする
      @sns_id = sns_info[:sns].id
      render template: 'devise/registrations/new'
    end
  end
end