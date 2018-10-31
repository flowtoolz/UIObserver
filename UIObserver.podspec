 Pod::Spec.new do |s|
    
    # meta infos
    s.name             = "UIObserver"
    s.version          = "0.1.0"
    s.summary          = "The UI layer for SwiftObserver"
    s.description      = "Reactive UI based on SwiftObserver: You receive user input from the UI. The UI receives data to present."
    s.homepage         = "http://flowtoolz.com"
    s.license          = 'commercial'
    s.author           = { "Flowtoolz" => "contact@flowtoolz.com" }
    s.source           = {  :git => "https://github.com/flowtoolz/UIObserver.git",
                            :tag => s.version.to_s }
    
    # compiler requirements
    s.requires_arc = true
    s.swift_version = '4.0'
    
    # minimum platform SDKs
    s.platforms = {:ios => "9.0", :osx => "10.10", :tvos => "9.0"}

    # minimum deployment targets
    s.ios.deployment_target  = '9.0'
    s.osx.deployment_target = '10.10'
    s.tvos.deployment_target = '9.0'

    # sources
    s.ios.source_files = 'Code/UIKit/**/*.swift'
    s.tvos.source_files = 'Code/UIKit/**/*.swift'
    s.osx.source_files = 'Code/AppKit/**/*.swift'
    s.source_files = 'Code/*.swift'

    # dependencies
    s.dependency 'SwiftObserver'
end
