# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'celluloid/io/serial_port/version'

Gem::Specification.new do |spec|
  spec.name          = 'celluloid-io-serialport'
  spec.version       = Celluloid::IO::SerialPort::VERSION
  spec.authors       = ['Kaz Walker']
  spec.email         = ['kaz.walker@printtopeer.com']
  spec.description   = %q{Adds serial port support to Celluloid::IO}
  spec.summary       = %q{Evented serial port IO for Celluloid Actors.}
  spec.homepage      = 'https://github.com/PrintToPeer/celluloid-io-serialport'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'celluloid-io', '~> 0.15.0'
  spec.add_runtime_dependency 'serialport', '~> 1.1.0'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
end