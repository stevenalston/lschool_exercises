require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative '../transaction'

class TestTransaction < MiniTest::Test
  def setup
    @transaction1 = Transaction.new(50)
  end

  def test_prompt_for_payment
    input = StringIO.new('50\n')
    $stdout = StringIO.new
    @transaction1.prompt_for_payment(input: input)
    assert_equal 50, @transaction1.amount_paid
  end



end