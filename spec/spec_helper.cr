Kemal.config.env = "test"

require "spec"
require "spec-kemal"
require "../src/mocr"

Spec.override_default_formatter Spec::VerboseFormatter.new
