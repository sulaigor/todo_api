class Todo < ApplicationRecord

  belongs_to :user

  validates :text, presence: true

  def date
    self.creation_date.strftime('%Y-%m-%d')
  end

  def marked
    self.marked_done ? 'yes' : 'no'
  end

end
