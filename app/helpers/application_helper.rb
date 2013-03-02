module ApplicationHelper
  def display_current_admin
    return unless admin_logged?

    message = t('.welcome', email: current_admin.profile.present? ? current_admin.profile.name : current_admin.email)
    message << ' | '
    message << link_to(t('.logout'), backend_session_destroy_path, method: :delete, class: 'logout')
    message.html_safe
  end

  def display_alert
    content_tag :div, class: 'alert' do
      flash[:alert]
    end if flash[:alert]
  end

  def display_notice
    content_tag :div, class: 'notice' do
      flash[:notice]
    end if flash[:notice]
  end

  def field_error(model, field)
    if model.errors[field].any?
      content_tag :span, class: 'error' do
        model.errors[field].first
      end
    end
  end
end
