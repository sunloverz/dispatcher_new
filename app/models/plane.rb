class Plane < ActiveRecord::Base
  enum status: {in_hangar: 0, waiting: 1, departed: 2}

  has_many :histories, dependent: :destroy

  after_save :create_new_history

  private
  def create_new_history
    status = self.status
    self.histories.create(status: status)
  end

end
