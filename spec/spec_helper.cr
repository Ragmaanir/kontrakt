require "../src/kontrakt"
require "microtest"

macro test_process(env, &block)
  {%
    c = <<-CRYSTAL
      require "../src/kontrakt"

      #{block.body.id}
    CRYSTAL
  %}

  Process.run("crystal", ["eval", {{c}}], {{env}})
end

include Microtest::DSL
Microtest.run!
