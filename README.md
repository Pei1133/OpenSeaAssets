# Portto
ERC-721/ERC-1155 收藏品頁面

## Installation
  - `pod init`
  - Open the .xcworkspace file
  - Fill in **OpenSea API Key** and **Infura API Key**

## Design Pattern
  - MVVM + SwiftUI

## Feature
  - Asset
    - Fetch assests
    - Show assets with Grid
    - Infinite scroll
    - Navigate to AssetDetail
    - Get Ethereum Balance

  - AssetDetail
    - Show asset detail information (image, name and description) 
    - Open permalink with a fixed button
    
  - Network Service
  
## Dependency
  - [Alamofire](https://github.com/Alamofire/Alamofire) - Network requesting
  - [SDWebImageSwiftUI](https://github.com/SDWebImage/SDWebImageSwiftUI) - Image downloading and chache

