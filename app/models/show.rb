require 'pry'

class Show < ActiveRecord::Base
  has_many :characters
  belongs_to :network
  has_many :actors, through: :characters

  def actors_list
    self.actors.map {|actor| actor.full_name}
  end

  def build_network(network={})
    new_network = Network.new(network)
    self.network = new_network
  end

end
