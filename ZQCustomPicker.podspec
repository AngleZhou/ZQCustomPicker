#
<<<<<<< HEAD
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
  s.preserve_paths = 'ZQCustomPickerDemo'
  # s.public_header_files = 'Pod/Classes/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
=======
#  Be sure to run `pod spec lint ZQCustomPicker.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "ZQCustomPicker"
  s.version      = "0.0.1"
  s.summary      = "A pop-up picker from the bottom of screen"
  s.homepage     = "https://github.com/AngleZhou"
  s.license      = "MIT"
  s.author       = { "AngleZhou" => "zhouq87724@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/AngleZhou/ZQCustomPicker.git", :tag => "0.0.1" }
  s.source_files = 'ZQCustomPicker/*.{h,m}'
  s.preserve_paths = 'ZQCustomPickerDemo'
  s.framework    = 'UIKit'
>>>>>>> 8ebaf5fa4d19b10857d62c54adb0b8cefa107bb1
end
