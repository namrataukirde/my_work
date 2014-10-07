module ApplicationHelper
  def my_flash
    flash[:notice]
    # flash is not user defined method
  end
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
       attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end
end
