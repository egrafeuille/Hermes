module CyclesHelper
  def nested_cycles(cycles)
    cycles.map do |cycle, sub_cycles|
#      render(cycle) + content_tag(:div, nested_cycles(sub_cycles), :class => "nested_cycles")
      render(cycle) + nested_cycles(sub_cycles)
    end.join.html_safe
  end
end
