module ApplicationHelper
  def active_for(*paths)
    "active" if paths.any? do |path|
      controller, action = path.split("/")
      Rails.logger.info "controller: #{controller} , action: #{action}"
      controller == controller_name && (action.blank? || action == action_name)
    end
  end
end
