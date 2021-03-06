require "colorize"

module Kontrakt
  VERSION = {{ `shards version #{__DIR__}`.strip.stringify }}

  class ContractViolation < Exception
    getter condition

    def initialize(@condition : String, message : String? = nil)
      msg = "Condition #{condition.colorize(:red).mode(:bold)} failed"
      msg += " - #{message.colorize(:yellow).mode(:bright)}" if message
      super(msg)
    end
  end

  class PreConditionViolation < ContractViolation
  end

  class PostConditionViolation < ContractViolation
  end

  macro precondition(condition, message = nil)
    Kontrakt.general_assert(Kontrakt::PreConditionViolation, {{condition}}, {{message}})
  end

  macro postcondition(condition, message = nil)
    Kontrakt.general_assert(Kontrakt::PostConditionViolation, {{condition}}, {{message}})
  end

  macro general_assert(cls, condition, message = nil)
    {% if !env("DISABLE_CONTRACTS") %}
      if !({{condition}})
        raise {{cls}}.new("{{condition}}", {{message}})
      end
    {% end %}
  end
end
