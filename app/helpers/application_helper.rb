module ApplicationHelper
  def display_current_admin
    return unless admin_logged?

    message = t('.welcome', email: current_admin.try(:email))
    message << ' | '
    message << link_to(t('.logout'), backend_session_destroy_path, method: :delete, class: 'logout')
    message.html_safe
  end
end
