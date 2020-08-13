class Api::V1::MetricsController < ApplicationController
  def index
    render json: summarized_metrics(1.hour.ago)
  end

  def create
    render status: :ok if new_metric.save!
  end

  def destroy
    render status: :ok if metrics.destroy_all
  end

  private

  def new_metric
    @new_metric ||= Metric.new(metric_params)
  end

  def metrics
    @metrics ||= Metric.filter_by(key: params[:key])
  end

  def metric_params
    params.permit(:key, :value)
  end

  def summarized_metrics(timeframe)
    @summarized_metrics ||= Metric.summary_since(timeframe)
  end
end
