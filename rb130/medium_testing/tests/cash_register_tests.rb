require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative '../cash_register'
require_relative '../transaction'

class CashRegisterTests < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction1 = Transaction.new(50)
    @transaction1.amount_paid = 50
    @transaction2 = Transaction.new(100)
    @transaction2.amount_paid = 150
    @transaction3 = Transaction.new(25)
    @transaction3.amount_paid = 35.0
  end

  def test_accept_money
    @register.accept_money(@transaction1)
    assert_equal(150, @register.total_money)
  end

  def test_change
    assert_equal(50, @register.change(@transaction2))
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction3.item_cost}.\n") do
      @register.give_receipt(@transaction3)
    end
  end
end