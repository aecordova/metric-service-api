class Metric < ApplicationRecord
  validates :key, presence: true
  validates :value, presence: true

  def self.summary_since(timeframe)
    select('key, sum(value) as total').where('created_at <= ?', timeframe).group('key')
  end
end
