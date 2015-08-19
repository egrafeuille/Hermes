module ApplicationHelper
  
  def nav_links
    items = [home_link, plan_link, workout_link, group_link, target_link, setting_link]
    content_tag :ul, :class => "nav" do
      items.collect { |item| concat item}
    end
  end

  def home_link
    nav_item_active_if(false) do
     link_to "Home", root_path
    end
  end

  def plan_link
    nav_item_active_if(false) do
      link_to "Plan", moves_path
    end
  end

  def workout_link
    nav_item_active_if(false) do
      link_to "Workout", "#"
    end
  end

  def group_link
    nav_item_active_if(false) do
      link_to "Group", "#"
    end
  end

  def target_link
    nav_item_active_if(false) do
      link_to "Target", "#"
    end
  end

  def setting_link
    nav_item_active_if(false) do
      link_to "Setting", "#"
    end
  end


  def nav_item_active_if(condition, attributes = {}, &block)
    if condition
      attributes["class"] = "active"
    end
    content_tag(:li, attributes, &block)
  end
  
  
end
