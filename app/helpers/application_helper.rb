module ApplicationHelper
  def display_current_admin
    return unless admin_logged?

    message = content_tag :span, t('.welcome', email: current_admin.profile.present? ? current_admin.profile.name : current_admin.email)
    message << image_tag(current_admin.profile.avatar(:thumb), width: '32px') if current_admin.profile.present?
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
    Rails.logger.debug model.errors.inspect
    if model.errors[field].any?
      content_tag :span, class: 'error' do
        model.errors[field].first
      end
    end
  end
end
