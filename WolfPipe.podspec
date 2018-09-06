#
# Be sure to run `pod lib lint WolfPipe.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WolfPipe'
  s.version          = '0.1.1'
  s.summary          = 'A simple implementation of the forward pipe operator.'

#  s.description      = <<-DESC
#TODO: Add long description of the pod here.
#                       DESC

  s.homepage         = 'https://github.com/wolfmcnally/WolfPipe'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Wolf McNally' => 'wolf@wolfmcnally.com' }
  s.source           = { :git => 'https://github.com/wolfmcnally/WolfPipe.git', :tag => s.version.to_s }

  s.source_files = 'WolfPipe/Classes/**/*'

  s.swift_version = '4.2'

  s.ios.deployment_target = '10.0'

  s.module_name = 'WolfPipe'
end
