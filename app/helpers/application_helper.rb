module ApplicationHelper
  def role_badge_label
    { "admin" => "ADM", "manager" => "MGR", "junior" => "JR" }[current_user&.role]
  end

  def role_badge_color
    { "admin" => "danger", "manager" => "primary", "junior" => "secondary" }[current_user&.role]
  end
end
