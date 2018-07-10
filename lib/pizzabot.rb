require_relative "pizzabot/version"
require_relative "pizzabot/delievery.rb"

module Pizzabot

  def self.pizzabot(command)
    Delievery.new(command).directions.join
  end

end
