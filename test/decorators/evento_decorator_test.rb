require 'test_helper'

class EventoDecoratorTest < ActiveSupport::TestCase
  def setup
    @evento = Evento.new.extend EventoDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
