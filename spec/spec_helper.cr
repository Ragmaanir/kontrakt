require "../src/kontrakt"
require "microtest"

macro test_process(env, &block)
  {%
    c = <<-CRYSTAL
      require "./src/kontrakt"

      #{block.body.id}
    CRYSTAL
  %}

  output = IO::Memory.new

  Process.run("crystal", ["eval", {{c}}], {{env}}, output: output, error: output)
end

include Microtest::DSL
Microtest.run!
