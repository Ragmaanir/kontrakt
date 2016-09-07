require "./spec_helper"

describe KontraktTest do
  test "test precondition" do
    assert_raises(Kontrakt::PreConditionViolation) { Kontrakt.precondition(1 == 0) }
    assert_raises(Kontrakt::PreConditionViolation) { Kontrakt.precondition(5 != 4 && 6 > 7) }
    Kontrakt.precondition(1 == 1)
    Kontrakt.precondition(1 == 1 && true != false)
  end

  test "test postcondition" do
    assert_raises(Kontrakt::PostConditionViolation) { Kontrakt.postcondition(1 == 0) }
    assert_raises(Kontrakt::PostConditionViolation) { Kontrakt.postcondition(5 != 4 && 6 > 7) }
    Kontrakt.postcondition(1 == 1)
    Kontrakt.postcondition(1 == 1 && true != false)
  end
end
