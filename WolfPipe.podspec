Pod::Spec.new do |s|
  s.name             = 'WolfPipe'
  s.version          = '2.0.0'
  s.summary          = 'An implementation of the forward and backward pipe operators and other functional programming conveniences.'

  s.homepage         = 'https://github.com/wolfmcnally/WolfPipe'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Wolf McNally' => 'wolf@wolfmcnally.com' }
  s.source           = { :git => 'https://github.com/wolfmcnally/WolfPipe.git', :tag => s.version.to_s }

  s.source_files = 'Sources/WolfPipe/**/*'

  s.swift_version = '5.0'

  s.ios.deployment_target = '9.3'
  s.macos.deployment_target = '10.13'
  s.tvos.deployment_target = '11.0'

  s.module_name = 'WolfPipe'
end
