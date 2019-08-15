module TodoHelper

  def self.json_response(object, params = nil)
    if object.kind_of?(Array)
      arr = []
      object.map.with_index do |item, i|
        item = TodoHelper.get_response_item(item, i + 1)
        arr << item
      end
      arr
    else
      TodoHelper.get_response_item(object, params[:id])
    end
  end

  private

  def self.get_response_item(item, order)
    {
      order: order,
      text: item.text,
      done: item.marked,
      date: item.date
    }
  end

end
