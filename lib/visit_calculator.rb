# frozen_string_literal: true

# Receives prepared data and executes the calculations
class VisitCalculator
  def initialize(data:)
    @data = data
  end

  def call
    collect_route_frequency
  end

  private

  attr_reader :data

  def collect_route_frequency
    route_frequency = routes_list.each_with_object(Hash.new(0)) do |item, hash|
      hash[item] += 1
    end
    route_frequency.sort_by { |_key, value| value }.reverse
  end

  def routes_list
    @routes_list ||= data.each_with_object([]) do |item, routes|
      routes << item.first
    end
  end
end
