require_relative 'modules/colors'
# Class to contain Computer logic
class Computer
  include Colors

  attr_reader :color_code

  def create_new_color_code
    create_color_code
  end
end
