class Api::V1::MetricsController < ApplicationController
  def index
    render json: summarized_metrics(1.hour.ago)
  end

  def create
    render status: :ok if metric.save!
  end

  def delete
    render status: :ok if metric.destroy!
  end

  private

  def metric
    @metric ||= params[:key] ? Metric.find_by(key: params[:key]) : Metric.new(metric_params)
  end

  def metric_params
    params.require(:metric).permit(:key, :value)
  end

  def summarized_metrics(timeframe)
    @summarized_metrics = Metric.summary_since(timeframe)
  end
end
