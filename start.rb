require './lib/generate_cpf'

# Method that generates cpf without digits
def build_cpf
  cp = []
  9.times.each do |c|
    c = (0..9).to_a.sample
    cp << c
  end
  cp
end


cpf = CpfFake::CPF.new(build_cpf) #object

cpf.build_digit #object.build
