platform :ios, '11.0'
inhibit_all_warnings!

source 'https://github.com/cocoapods/specs.git'

target 'MadUnitExample' do

  use_frameworks!

  # Networking
  pod 'Moya/RxSwift'

  # Reactive
  pod 'RxSwift'
  pod 'RxCocoa'

  # Utilities
  pod 'SwiftLint'
  
  # Routing
  pod 'XCoordinator'
  pod 'XCoordinator/RxSwift'
  
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['LD_NO_PIE'] = 'NO'
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
            
            if config.name == 'Release'
                config.build_settings['SWIFT_COMPILATION_MODE'] = 'wholemodule'
            end
        end
    end
end
