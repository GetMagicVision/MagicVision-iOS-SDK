Pod::Spec.new do |s|
  s.name             = "MagicVision"
  s.version          = "0.1.0"
  s.summary          = "A short description"
  s.description      = <<-DESC
                       a longer description
                       DESC

  s.homepage         = "https://github.com/GetMagicVision/MagicVision-iOS-SDK"
  s.license          = "MIT"
  s.author           = "MagicVision Contributors"
  s.source           = { :git => "https://github.com/GetMagicVision/MagicVision-iOS-SDK.git", :tag => "v#{s.version}" }
  s.vendored_frameworks = "Frameworks/MagicVision.framework"

  s.platform     = :ios, "8.0"
  s.requires_arc = true
end
