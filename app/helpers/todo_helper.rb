module TodoHelper

  def self.json_response(object)
    if object.kind_of?(Array)
      arr = []
      object.map do |item|
        item = TodoHelper.get_response_item(item)
        arr << item
      end
      arr
    else
      TodoHelper.get_response_item(object)
    end
  end

  private

  def self.get_response_item(item)
    {
      text: item.text,
      done: item.marked_done ? 'yes' : 'no',
      date: item.creation_date.strftime("%Y-%m-%d")
    }
  end

end
