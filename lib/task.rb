class Task
  attr_reader :name, :complete
  def initialize(name, complete = false)
    @name = name
    @complete = complete
  end
end
