# iOS programming
### Tool
  - [makeappicon](https://makeappicon.com/): generate and resize app icon
  - [fus](https://github.com/tsabend/fus): find unused Swift classes
  - [FengNiao](https://github.com/onevcat/FengNiao): simple command-line util to deleting unused image resource files from you Xcode project.
  - [SwiftLint](https://github.com/realm/SwiftLint): A tool to enforce Swift style and conventions, loosely based on GitHub's Swift Style Guide.

### Firebase
- [FireBase, GoogleAuth 설정](https://brunch.co.kr/@tilltue/14)
- [Google 로그인 구현](https://firebase.google.com/docs/auth/ios/google-signin?hl=ko)

# infinite scroll on UICollectionView 
```swift
override func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.size.height {     // 마지막에서 작동함
       // if offsetY + (cellHeight*2) > contentHeight - scrollView.frame.size.height { //같이 해야 미리로딩가능
            loadSomeDataAndIncreaseDataLengthFunction()
            self.collectionView.reloadData()
        }
    }
```


---------------------

### AUDIGA 개발에 참고할 것들
- [MKMapKit기반 더블탭 확대/축소 방법](https://swifter.kr/2016/05/12/mkmapkit%EA%B8%B0%EB%B0%98-%EB%8D%94%EB%B8%94%ED%83%AD-%ED%99%95%EB%8C%80%EC%B6%95%EC%86%8C-%EB%B0%A9%EB%B2%95/)
- [Mapkit 사용법](http://m.blog.naver.com/zll11/220744646888)
- [MKPointAnnotations touch event in swift](http://stackoverflow.com/questions/26991473/mkpointannotations-touch-event-in-swift)
- [Add radius and shadow](http://stackoverflow.com/questions/3316424/cant-add-a-corner-radius-and-a-shadow), [other version](http://stackoverflow.com/questions/24644802/swift-problems-with-corner-radius-and-drop-shadow)
- [shadow with blur](http://stackoverflow.com/questions/34269399/how-to-control-shadow-spread-and-blur)
- [UPCarouselFlowLayout](https://github.com/ink-spot/UPCarouselFlowLayout): A fancy carousel flow layout for UICollectionView on iOS.
    - [stackoverflow](http://stackoverflow.com/questions/42003296/is-it-possible-to-create-a-scroll-view-with-an-animated-page-control-in-swift)

![demo](https://raw.githubusercontent.com/ink-spot/UPCarouselFlowLayout/master/images/demo.gif)

- [StretchHeader](https://github.com/y-hryk/StretchHeader)

![Demo](https://raw.githubusercontent.com/y-hryk/StretchHeader/master/sample_01.gif)
![Demo](https://raw.githubusercontent.com/y-hryk/StretchHeader/master/sample_02.gif)

- [MMParallaxCollectionView](https://github.com/MillmanY/MMParallaxCollectionView): Custom CollectionView with Parallax effect

![demo](https://github.com/MillmanY/MMParallaxCollectionView/blob/master/DemoSource/Demo.gif?raw=true)

- [expanding-collection](https://github.com/Ramotion/expanding-collection): ExpandingCollection is a card peek/pop controller
![demo](https://raw.githubusercontent.com/Ramotion/expanding-collection/master/preview.gif)

- [Google Maps API](https://developers.google.com/maps/documentation/ios-sdk/?hl=ko): iOS 앱에 Google 지도

- [FBAnnotationClusteringSwift](https://github.com/ribl/FBAnnotationClusteringSwift): Swift translation of FB Annotation Clustering, which clusters pins on the map for iOS. 
![demo](https://github.com/ribl/FBAnnotationClusteringSwift/blob/master/GitHubImages/simulatorShot.png?raw=true)
- [iOS-MapKit-Tutorial](https://github.com/maximbilan/iOS-MapKit-Tutorial): iOS MapKit Getting Started
- [mapkit-beginner-guide](http://www.appcoda.com/mapkit-beginner-guide/): Working with MapKit: Annotations and Shape Rendering
- [mapkit-polyline-polygon](http://www.appcoda.com/mapkit-polyline-polygon): MapKit Beginner’s Guide: Polylines, Polygons, and Callouts
- [iOS9-day-by-day](https://github.com/shinobicontrols/iOS9-day-by-day): Example 많음, Apple pay, Map

### Sites
- [Some Swift libraries every iOS developer should know about](http://www.oodlestechnologies.com/blogs/Some-Swift-libraries-every-iOS-developer-should-know-about)
- swift extension: http://realignist.me/code/2016/06/05/swift-snippets.html
- http://swift.leantra.kr/
- https://github.com/JigarM/Infin- ite-UIITableview-Scroll
- http://pjkstory.blogspot.jp/2016/06/swift-2-swift-tableview-infinite-scroll.html
- https://github.com/johnnyclem/JSON-TableView-in-Swift
- https://www.raywenderlich.com/113388/storyboards-tutorial-in-ios-9-part-1
- http://stackoverflow.com/questions/25902916/ios-8-swift-avaudioplayer-play-remote-audio-wowza-server
- http://stackoverflow.com/questions/34563329/how-to-play-mp3-audio-from-url-in-ios-swift
- https://www.raywenderlich.com/107439/uicollectionview-custom-layout-tutorial-pinterest
- http://www.appcoda.com/instagram-app-parse-swift/
- https://github.com/kenechilearnscode/APISearchTutorial
- http://dev.classmethod.jp/smartphone/iphone/ios-pinterest-layout/
- https://github.com/k-neo/StaggeredGridLayout
- http://zappdesigntemplates.com/collectionview-flow-layout-from-grid-to-list-layout/
- https://github.com/seapy/awesome/blob/master/iOS/library.md#
- 아이폰 개발자를 위한 아이콘 셋: http://www.acrosoft.pe.kr/blog/573
- Hex Color Code를 이용할 수 있게 UIColor 확장하기

```swift
extension UIColor {
    convenience init? (fromHex hex: String) {
        let hexPattern = try! NSRegularExpression(pattern: "^[0-9a-fA-F]{6}$",
                                                  options: [.anchorsMatchLines])
        let range =  NSRange(location: 0, length: hex.characters.count)
        
        guard hexPattern.matches(in: hex, 
                                 options: [],
                                 range: range).count == 1 
        else { return nil }
        
        let positionR = hex.index(hex.startIndex, offsetBy: 2)
        let positionG = hex.index(hex.startIndex, offsetBy: 4)

        guard let r = Double("0x" + hex.substring(to: positionR)),
            let g = Double("0x" + hex.substring(with: positionR..<positionG)),
            let b = Double("0x" + hex.substring(from: positionG)) else { return nil }
        
        self.init(red: CGFloat(r / 255), 
                  green: CGFloat(g / 255), 
                  blue: CGFloat(b / 255), 
                  alpha: 1)
    }
}
```

- Function Parameter Names
함수의 파라미터는 external parameter name 과 local parameter name 을 둘 다 가진다. external parameter name 은 함수를 호출할 때 arguments에 이름을 지정하기 위해 사용되고, local parameter name 은 함수 내부 구현 안에서 사용이 되는 이름이다.
```swift
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // function body 시작
    // firstParameterName 과 secondParameterName 은
    // 함수로 넘어오는 첫 번째와 두 번째 argument 값을 각각 가리킨다
}
someFunction(1, secondParameterName: 2)
```
디폴트로 첫 번째 파라미터는 external name이 생략되고, 두번째 파라미터부터는 자신의 local name을 external name으로 사용한다. 모든 파라미터는 반드시 서로 구분되는 local name을 가져야 한다. external name의 경우에는 파라미터 두 개가 동일한 external name을 가져도 컴파일 에러는 나지 않지만, 당연히 서로 구분되게 정의하는 것이 좋다.

> 출처: http://wlaxhrl.tistory.com/10 [찜토끼의 Swift 블로그]

- https://infinum.co/the-capsized-eight/top-10-ios-swift-libraries-every-ios-developer-should-know-about
- facewhere: https://github.com/BeauNouvelle/FaceAware?utm_source=mybridge&utm_medium=blog&utm_campaign=read_more
- https://grokswift.com/updating-alamofire-to-swift-3-0/
- http://www.slideshare.net/sunhyouplee/realm-60539221

- https://github.com/MengTo/Spring
- Swift 3 - Alamofilre 4.0 multipart upload with progress: http://www.amaravadee.com/swift-3-alamofilre-4-0-multipart-upload-with-progress/
