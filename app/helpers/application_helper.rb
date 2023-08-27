# frozen_string_literal: true

module ApplicationHelper
  def active_if(*names)
    'active' if active_menu?(*names)
  end

  def active_menu?(*names)
    active_namespace?(*names) || active_controller?(*names) || active_action?(*names)
  end

  def active_controller?(*names)
    names.any?(controller_path)
  end

  def active_namespace?(*namespaces)
    namespaces.any? { |namespace| controller_path.start_with?(namespace) }
  end

  def active_action?(*names)
    names.any?("#{controller_path}##{action_name}")
  end
end
