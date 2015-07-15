class Cycle < ActiveRecord::Base
  has_ancestry

  def as_json(*args)
      super.tap { |hash| hash["text"] = hash.delete "name" }
  end

end

