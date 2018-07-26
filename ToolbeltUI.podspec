Pod::Spec.new do |s|
  s.name             = 'ToolbeltUI'
  s.version          = '0.0.1'
  s.summary          = 'Toolbelt library containing UI components'


  s.description      = <<-DESC
    Toolbelt library containing UI components
                       DESC

  s.homepage         = 'https://github.com/andrewwells/Toolbelt'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'andrewwells' => 'alw331@gmail.com' }
  s.source           = { :git => 'https://github.com/andrewwells/Toolbelt.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'ToolbeltUI/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Toolbelt' => ['ToolbeltUI/Assets/*.png']
  # }

  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
