class CPF
    attr_accessor :cpf

    def initialize(cpf)
        @cpf = cpf
    end

    def build_digit
        calc_digit_I
    end

    # 10A + 9B + 8C + 7D + 6E + 5F + 4G + 3H + 2I
    # First Digit
    def calc_digit_I
        count = 11
        sum = 0
        mult = 0
        cpf.each_char do |c|
            mult = c.to_i * (count -= 1)
            sum += mult
        end
        digit_a = sum.remainder(11)

        if digit_a == 0 || digit_a == 1
            digit_a = 0
            puts "Primeiro Digito: #{digit_a}"
            cpf_i = cpf << digit_a.to_s
        else
            digit_a = 11 - digit_a
            puts "Primeiro Digito: #{digit_a}"
            cpf_i = cpf << digit_a.to_s
        end
        calc_digit_J(cpf_i)
    end

    # 11A + 10B + 9C + 8D + 7E + 6F + 5G + 4H + 3I + 2J
    # Second Digit
    def calc_digit_J(cpf_i)
        count = 12
        sum = 0
        cpf_i.each_char do |c|
            mult = c.to_i * (count -= 1)
            sum += mult
        end
        digit_b = sum.remainder(11)

        if digit_b == 0 || digit_b == 1
            digit_b = 0
            puts "Segundo Digito: #{digit_b}"
            cpf_ij = cpf << digit_b.to_s
            puts "CPF: #{cpf_ij}"
        else
            digit_b = 11 - digit_b
            puts "Segundo Digito: #{digit_b}"
            cpf_ij = cpf_i << digit_b.to_s
            puts "CPF: #{cpf_ij}"
        end
    end
end
