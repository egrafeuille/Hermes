module ApplicationHelper
  
  def nav_links
    items = [home_link, plan_link, group_link, user_link, target_link, setting_link]
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
      link_to "Plans", moves_path
    end
  end

  def group_link
    nav_item_active_if(false) do
      link_to "Groups", groups_path
    end
  end

  def user_link
    nav_item_active_if(false) do
      link_to "Users", users_path
    end
  end

  def target_link
    nav_item_active_if(false) do
      link_to "Targets", "#"
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


  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name, "#", id: "remove_link")    
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)    
    end
    link_to(name, "#", "data-association" => "#{association}" , "data-content" => "#{fields}", :class => "link_to_add_fields" )
  end
  
end