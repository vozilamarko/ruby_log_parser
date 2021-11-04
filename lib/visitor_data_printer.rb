# frozen_string_literal: true

# Prints calculated data
class VisitorDataPrinter
  def initialize(visits:, calculation_type:)
    @visits = visits
    @calculation_type = calculation_type
  end

  def call
    print_data
  end

  private

  attr_reader :visits, :calculation_type

  def print_data
    puts "Calculated number of #{calculation_type}:"
    visits.each do |i|
      puts "#{i.first} #{i.last} #{calculation_type}"
    end
    puts "\n"
  end
end
