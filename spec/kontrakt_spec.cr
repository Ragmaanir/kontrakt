require "./spec_helper"

describe Kontrakt do
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

  test "env var to disable contracts" do
    result = test_process({} of String => String) do
      Kontrakt.precondition(false)
    end

    assert !result.success?

    result = test_process({"DISABLE_CONTRACTS" => ""}) do
      Kontrakt.precondition(false)
    end

    assert result.success?
  end
end
