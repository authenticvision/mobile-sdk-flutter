#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint authentic_vision_sdk.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'authentic_vision_sdk'
  s.version          = '0.0.1'
  s.summary          = 'Authentic Vision iOS SDK Flutter Plugin'
  s.homepage         = 'https://https://github.com/authenticvision/mobile-sdk-flutter'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Oliver Kuckertz' => 'oliver.kuckertz@authenticvision.com' }
  s.source           = { :path => '.' }

  s.source_files        = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.vendored_frameworks = 'Frameworks/AuthenticVisionSDK.xcframework'

  s.dependency 'Flutter'
  s.platform = :ios, '12.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end
