module ApplicationHelper
  def title_for_boolean(boolean)
    boolean ? "Yes" : "-"
  end
end
