class Printer

  def print(list)
    list_view = list.map do |page|
      "#{page[0]} #{page[1]} "
    end
    list_view.join
  end

end
