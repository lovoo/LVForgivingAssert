#
# Be sure to run `pod lib lint LVForgivingAssert.podspec' to ensure this is a
# valid spec before submitting.
#

Pod::Spec.new do |s|
  s.name             = "LVForgivingAssert"
  s.version          = "0.0.1"
  s.summary          = "LVForgivingAssert makes it possible to test the release behaviour of methods that are guarding parameters with NSAssert."
  s.description      = <<-DESC
Using the makro LVIgnoreAssert(^{}) ignores all called NSAssert inside the block. Be sure to only use this while unit testing your app, not in production environment!
                       DESC

  s.homepage         = "https://github.com/Lovoo/LVForgivingAssert"
  s.author           = { "Benjamin Herzog" => "mail@benchr.de" }
  s.source           = { :git => "https://github.com/lovoo/LVForgivingAssert.git", :tag => s.version.to_s }
  s.license          = "BSD"

  s.ios.deployment_target = '7.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'LVForgivingAssert/**/*'
end
