class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  PROVIDERS = {
    "google_oauth2" => "Google",
    "github" => "GitHub"
  }.freeze

  def google_oauth2
    handle_auth("google_oauth2")
  end

  def github
    handle_auth("github")
  end

  def failure
    redirect_to root_path, alert: I18n.t("devise.omniauth_callbacks.failure")
  end

  private

  def handle_auth(provider)
    auth_data = request.env["omniauth.auth"]
    @user = User.from_omniauth(auth_data)

    if @user.persisted?
      flash[:notice] = I18n.t("devise.omniauth_callbacks.success", kind: PROVIDERS[provider])
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = auth_data.slice("provider", "uid", "info") # or minimal required
      Rails.logger.warn("Omniauth failed: #{@user.errors.full_messages.join(', ')}")
      redirect_to new_user_registration_url, alert: I18n.t("devise.omniauth_callbacks.failure")
    end
  end
end
