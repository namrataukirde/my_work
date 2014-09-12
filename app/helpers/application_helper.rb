module ApplicationHelper
  def my_flash
    flash[:notice]
    # flash is not user defined method
  end
end
