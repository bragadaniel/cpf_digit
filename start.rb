require './lib/generate_cpf'

# Method that generates cpf without digits
def build_cpf
  Array.new(9) { rand(0..9) }
end

cpf = CpfFake::CPF.new(build_cpf) # object
cpf.build_digit # object.build

