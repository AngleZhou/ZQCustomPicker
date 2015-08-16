#

# Be sure to run `pod lib lint ZQCustomPicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ZQCustomPicker"
  s.version          = "0.1.0"
  s.summary          = "A pop-up picker from the bottom of screen."
  s.homepage         = "https://github.com/AngleZhou/ZQCustomPicker"
  s.license          = 'MIT'
  s.author           = { "AngleZhou" => "zhouq87724@163.com" }
  s.source           = { :git => "https://github.com/AngleZhou/ZQCustomPicker.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/*.{h,m}'
  s.resource_bundles = {
    'ZQCustomPicker' => ['Pod/Assets/*.png']
  }
  # s.public_header_files = 'Pod/Classes/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

end
