# Module to store colors
module Colors
  def list_of_colors
    %w[red green blue yellow orange purple]
  end

  def colors
    list_of_colors.to_h { |item| [item, list_of_colors.index(item) + 1] }
  end

  def create_color_code
    @color_code = []
    @color_code.push(list_of_colors.sample) until @color_code.size == 4
  end
end
