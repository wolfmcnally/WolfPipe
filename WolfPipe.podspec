Pod::Spec.new do |s|
  s.name             = 'WolfPipe'
  s.version          = '1.0.1'
  s.summary          = 'A simple implementation of the forward pipe operator.'

  s.homepage         = 'https://github.com/wolfmcnally/WolfPipe'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Wolf McNally' => 'wolf@wolfmcnally.com' }
  s.source           = { :git => 'https://github.com/wolfmcnally/WolfPipe.git', :tag => s.version.to_s }

  s.source_files = 'WolfPipe/Classes/**/*'

  s.swift_version = '4.2'

  s.ios.deployment_target = '10.0'
  s.macos.deployment_target = '10.13'
  s.tvos.deployment_target = '11.0'

  s.module_name = 'WolfPipe'
end
