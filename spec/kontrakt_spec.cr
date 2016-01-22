require "./spec_helper"

module KontraktTests
  class KontraktTest < Minitest::Test
    include Kontrakt

    def test_precondition
      assert_raises(Kontrakt::PreConditionViolation){ precondition(1 == 0) }
      assert_raises(Kontrakt::PreConditionViolation){ precondition(5 != 4 && 6 > 7) }
      precondition(1 == 1)
      precondition(1 == 1 && true != false)
    end

    def test_postcondition
      assert_raises(Kontrakt::PostConditionViolation){ postcondition(1 == 0) }
      assert_raises(Kontrakt::PostConditionViolation){ postcondition(5 != 4 && 6 > 7) }
      postcondition(1 == 1)
      postcondition(1 == 1 && true != false)
    end
  end
end
