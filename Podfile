# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

workspace 'SuperApp.xcworkspace'

def tests_pods
    pod 'Nimble'
    pod 'Quick'
end

target 'Super App' do
    use_frameworks!
    
    target 'Super AppTests' do
        inherit! :search_paths
        
        tests_pods
    end
end

target 'Core' do
    use_frameworks!
    
    project 'Core/Core.xcodeproj'
    
    target 'CoreTests' do
        inherit! :search_paths
        
        tests_pods
    end
end

target 'Login' do
    use_frameworks!
    
    project 'Login/Login.xcodeproj'
    
    target 'LoginTests' do
        inherit! :search_paths
        
        tests_pods
    end
end

target 'CoreLogin' do
    use_frameworks!
    
    project 'CoreLogin/CoreLogin.xcodeproj'
    
    target 'CoreLoginTests' do
        inherit! :search_paths
        
        tests_pods
    end
end

target 'ItauPass' do
    use_frameworks!
    
    project 'ItauPass/ItauPass.xcodeproj'
    
    target 'ItauPassTests' do
        inherit! :search_paths
        
        tests_pods
    end
end
