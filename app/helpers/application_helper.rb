module ApplicationHelper
  def message(name)
    "<div class='#{name}'>#{eval(name.to_s)}</div>" if eval(name.to_s)
  end
end
