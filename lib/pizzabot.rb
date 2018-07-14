require_relative "pizzabot/version"
require_relative "pizzabot/delivery.rb"

module Pizzabot

  def self.go(command)
    Delivery.new(command)
  end

end
