# frozen_string_literal: true

require_relative '../spec_helper'

module RubyPddl
  RSpec.describe Domain do
    describe '#name' do
      subject { Domain.new(name) }

      it_behaves_like 'a named object'
    end
  end
end
