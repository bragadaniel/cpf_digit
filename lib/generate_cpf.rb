module CpfFake
  class CPF
    attr_accessor :cpf

    def initialize(cpf)
      @cpf = cpf.map(&:to_i)
    end

    def build_digit
      cpf_with_first_digit = calc_digit_I
      calc_digit_J(cpf_with_first_digit)
    end

    private

    # 10A + 9B + 8C + 7D + 6E + 5F + 4G + 3H + 2I
    # First Digit
    def calc_digit_I
      sum = @cpf.each_with_index.reduce(0) do |acc, (num, idx)|
        acc + num * (10 - idx)
      end
      digit_a = sum % 11
      digit_a = 0 if digit_a < 2
      digit_a = 11 - digit_a if digit_a >= 2
      puts "Primeiro Dígito: #{digit_a}"
      @cpf + [digit_a]
    end

    # 11A + 10B + 9C + 8D + 7E + 6F + 5G + 4H + 3I + 2J
    # Second Digit
    def calc_digit_J(cpf_with_first_digit)
      sum = cpf_with_first_digit.each_with_index.reduce(0) do |acc, (num, idx)|
        acc + num * (11 - idx)
      end
      digit_b = sum % 11
      digit_b = 0 if digit_b < 2
      digit_b = 11 - digit_b if digit_b >= 2
      puts "Segundo Dígito: #{digit_b}"
      full_cpf = cpf_with_first_digit + [digit_b]
      formatted_cpf = format_cpf(full_cpf)
      puts "CPF: #{formatted_cpf}"
      full_cpf
    end

    def format_cpf(cpf_array)
      cpf_str = cpf_array.join
      "#{cpf_str[0..2]}.#{cpf_str[3..5]}.#{cpf_str[6..8]}-#{cpf_str[9..10]}"
    end
  end
end
