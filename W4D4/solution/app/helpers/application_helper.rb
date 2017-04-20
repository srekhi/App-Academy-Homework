module ApplicationHelper
  def auth_token
    "<input type=\"hidden\"
      name=\"authenticity_token\"
      value='#{form_authenticity_token}''>".html_safe #it's converted to a string (no longer html), so no need to use erb tags. need interpolation.
  end
end
