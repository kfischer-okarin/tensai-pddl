# frozen_string_literal: true

require 'dry-initializer'

require 'tensai/pddl/data_types'

module Tensai::Pddl
  module Formula
    # Negated formula
    class Negated < Formula
      include Dry::Initializer.define -> do
        param :formula, type: DataTypes::InstanceOf(Formula)
      end

      def not
        formula
      end
    end
  end
end