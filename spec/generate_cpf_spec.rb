require 'spec_helper'
require './lib/generate_cpf'

RSpec.describe CpfFake::CPF do
  describe 'CPF #digit test' do
    let(:cpf_base) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
    subject { described_class.new(cpf_base) }

    it 'validates first digit' do
      first_digit = subject.send(:calc_digit_I).last
      expected_first_digit = 0 # calcule ou substitua pelo valor esperado com base no algoritmo
      expect(first_digit).to eq(expected_first_digit)
    end

    it 'validates second digit' do
      cpf_with_first_digit = subject.send(:calc_digit_I)
      second_digit = subject.send(:calc_digit_J, cpf_with_first_digit).last
      expected_second_digit = 9 # calcule ou substitua pelo valor esperado com base no algoritmo
      expect(second_digit).to eq(expected_second_digit)
    end
  end
end
