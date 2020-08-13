class Metric < ApplicationRecord
  validates :key, presence: true
  validates :value, presence: true

  include Filterable

  def self.summary_since(timeframe)
    group(:key).where('created_at >= ?', timeframe).sum(:value)
  end
end
