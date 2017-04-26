module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    toy = Toy.find_or_create_by(name: name)
    self.toys << toy # => self.toys returns all toys related to self. mutate this with toy instead of shifting self.toys memory reference elsewhere?
    
  end
end
