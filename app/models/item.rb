class Item < ApplicationRecord
  belongs_to :feed
  before_save :datetime_to_epoch, :change_score_range

  private

  def datetime_to_epoch
    self.published_epoch = self.published_at.to_i
  end

  def change_score_range
    unless self.score.nil?
      number_to_convert = self.score
      scaleMin = -100
      scaleMax = 100
      probMin = 0
      probMax = 1
      percent = (number_to_convert - probMin)/(probMax - probMin)
      self.score = percent*(scaleMax - scaleMin) + scaleMin
    end
  end

end
