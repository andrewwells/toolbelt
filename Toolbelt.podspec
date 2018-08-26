Pod::Spec.new do |s|
  s.name             = 'Toolbelt'
  s.version          = '0.0.2'
  s.summary          = 'A short description of Toolbelt.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/andrewwells/Toolbelt'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'andrewwells' => 'alw331@gmail.com' }
  s.source           = { :git => 'https://github.com/andrewwells/Toolbelt.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'Toolbelt/Classes/**/*'
end
