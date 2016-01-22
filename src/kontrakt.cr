require "./kontrakt/*"

module Kontrakt
  class ContractViolation < Exception
    getter condition

    def initialize(@condition, message = nil : String | Nil)
      msg = "Condition #{condition.colorize(:red).mode(:bold)} failed"
      msg += " - #{message.colorize(:yellow).mode(:bright)}" if message
      super(msg)
    end
  end

  class PreConditionViolation < ContractViolation
  end

  class PostConditionViolation < ContractViolation
  end

  macro precondition(condition, message=nil)
    general_assert(PreConditionViolation, {{condition}}, {{message}})
  end

  macro postcondition(condition, message=nil)
    general_assert(PostConditionViolation, {{condition}}, {{message}})
  end

  macro general_assert(cls, condition, message=nil)
    if !({{condition}})
      raise {{cls}}.new("{{condition}}", {{message}})
    end
  end
end
