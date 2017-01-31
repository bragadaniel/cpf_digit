require_relative 'validacpf'

# Method that generates cpf without digits
def build_cpf
  cp = Array.new

  9.times.each do |c|
      c = (0..9).to_a.sample
      cp << c
  end
   cp
end


cpf = CPF.new(build_cpf) #object

cpf.build_digit #object.build
