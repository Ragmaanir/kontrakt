require "./spec_helper"

describe KontraktTest do
  include Kontrakt

  test "test precondition" do
    assert_raises(Kontrakt::PreConditionViolation) { precondition(1 == 0) }
    assert_raises(Kontrakt::PreConditionViolation) { precondition(5 != 4 && 6 > 7) }
    precondition(1 == 1)
    precondition(1 == 1 && true != false)
  end

  test "test postcondition" do
    assert_raises(Kontrakt::PostConditionViolation) { postcondition(1 == 0) }
    assert_raises(Kontrakt::PostConditionViolation) { postcondition(5 != 4 && 6 > 7) }
    postcondition(1 == 1)
    postcondition(1 == 1 && true != false)
  end
end
