Gem::Specification.new do |s|
  s.name = "spass"
  s.version = "0.0.1"
  s.summary = "Generate passphrases"
  s.description = <<-EOS
    spass generates passphrases using random words
  EOS
  s.authors = ["Eric Pierce"]
  s.email = "wapcaplet88@gmail.com"
  s.homepage = "http://github.com/wapcaplet/spass"
  s.platform = Gem::Platform::RUBY

  s.add_development_dependency 'rspec', '>= 2.2.0'
  s.add_development_dependency 'rcov'
  #s.add_development_dependency 'yard'
  #s.add_development_dependency 'bluecloth'

  s.files = `git ls-files`.split("\n")
  s.require_path = 'lib'

  s.executables = ['spass']
end

