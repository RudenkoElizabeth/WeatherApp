use_frameworks!
platform :ios, '11.0'
inhibit_all_warnings!

def common_pods
    pod 'MBProgressHUD'
    pod 'RIBs'
    pod 'RxCocoa'
end

def shared_pods
    pod 'Alamofire'
    pod 'SwiftyJSON'
end

target 'WeatherApp' do
    common_pods
    shared_pods
end

target 'WeatherAppTests' do
    shared_pods
end
