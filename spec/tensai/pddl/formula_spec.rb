# frozen_string_literal: true

require_relative '../../spec_helper'

module Tensai::Pddl
  RSpec.describe Formula do
    let(:formula) { build(:atom) }

    describe '#not' do
      subject { formula.not }

      it 'returns a negated formula' do
        expect(subject).to be_a Formulas::Negated
        expect(subject.formula).to equal formula
      end

      it 'returns the original formula when negated' do
        expect(subject.not).to equal formula
      end
    end

    describe '#and' do
      let(:formula_2) { build(:atom) }
      let(:formula_3) { build(:atom) }

      context 'two formulas' do
        subject { formula.and formula_2 }

        it 'returns a and conjunction of both formulas' do
          expect(subject).to be_a Formulas::And
          expect(subject.formulas).to contain_exactly(formula, formula_2)
        end
      end

      context 'a conjunction and a formula' do
        subject { formula.and(formula_2).and(formula_3) }

        it 'returns a and conjunction of all formulas' do
          expect(subject).to be_a Formulas::And
          expect(subject.formulas).to contain_exactly(formula, formula_2, formula_3)
        end
      end

      context 'a formula and a conjunction' do
        subject { formula.and formula_2.and(formula_3) }

        it 'returns a and conjunction of all formulas' do
          expect(subject).to be_a Formulas::And
          expect(subject.formulas).to contain_exactly(formula, formula_2, formula_3)
        end
      end
    end

    describe '#or' do
      let(:formula_2) { build(:atom) }
      let(:formula_3) { build(:atom) }

      context 'two formulas' do
        subject { formula.or formula_2 }

        it 'returns a and conjunction of both formulas' do
          expect(subject).to be_a Formulas::Or
          expect(subject.formulas).to contain_exactly(formula, formula_2)
        end
      end

      context 'a conjunction and a formula' do
        subject { formula.or(formula_2).or(formula_3) }

        it 'returns a and conjunction of all formulas' do
          expect(subject).to be_a Formulas::Or
          expect(subject.formulas).to contain_exactly(formula, formula_2, formula_3)
        end
      end

      context 'a formula and a conjunction' do
        subject { formula.or formula_2.or(formula_3) }

        it 'returns a and conjunction of all formulas' do
          expect(subject).to be_a Formulas::Or
          expect(subject.formulas).to contain_exactly(formula, formula_2, formula_3)
        end
      end
    end

    describe '#implies' do
      let(:formula_2) { build(:atom) }

      subject { formula.implies formula_2 }

      it 'returns not a or b' do
        expect(subject).to be_a Formulas::Or
        expect(subject.formulas).to contain_exactly(formula.not, formula_2)
      end
    end
  end
end
