#
# Be sure to run `pod lib lint DropDownSw.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DropDownSw'
  s.version          = '0.1.3'
  s.summary          = 'Simple DropDown implementaion View.'
  s.swift_version    = '5.0'
  s.homepage         = 'https://github.com/motosw3600/DropDownSw'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'motosw3600' => 'motosw3600@gmail.com' }
  s.source           = { :git => 'https://github.com/motosw3600/DropDownSw.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'DropDownSw/Classes/**/*'
  s.resources = ['DropDownSw/Assets/*.png']
  s.resource_bundles = {
    'DropDownSw' => ['DropDownSw/Assets/*.png']
  }
end
