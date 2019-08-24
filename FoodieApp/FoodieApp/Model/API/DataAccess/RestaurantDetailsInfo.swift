//
//  RestaurantDetailsInfo.swift
//  FoodieApp
//
//  Created by Mervin Flores on 8/23/19.
//  Copyright © 2019 Mervin Flores. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

//MARK: - LocationInfo
struct LocationInfo {
    var address: String?
    var locality: String?
    var city: String?
    var latitude: String?
    var longitude: String?
    var zipcode: String?
    var countryID: Int?
}

extension LocationInfo: Argo.Decodable {
    static func decode(_ json: JSON) -> Decoded<LocationInfo> {
        let locationInfo = curry(LocationInfo.init)
        return locationInfo
            <^> json <|? "address"
            <*> json <|? "locality"
            <*> json <|? "city"
            <*> json <|? "latitude"
            <*> json <|? "longitude"
            <*> json <|? "zipcode"
            <*> json <|? "country_id"
    }
}

//MARK: - UserRating
struct UserRating{
    var rating_text: String?
    var rating_color: String?
    var custom_rating_text: String?
    var custom_rating_text_background: String?
    var rating_tool_tip: String?
}



extension UserRating: Argo.Decodable {
    static func decode(_ json: JSON) -> Decoded<UserRating> {
        
        print(json.description)
        let userRating = curry(UserRating.init)
        return userRating
            <^> json <|? "rating_text"
            <*> json <|? "rating_color"
            <*> json <|? "custom_rating_text"
            <*> json <|? "custom_rating_text_background"
            <*> json <|? "rating_tool_tip"
    }
}

//MARK: - ReviewInfo
struct ReviewInfo {
    var rating: Int?
    var reviewText: String?
    var id: Int?
    var ratingColor: String?
    var reviewTimeFriendly: String?
    var ratingText: String?
    var timestamp: Int?
    var likes: Int?
    var user: UserInfo?
    var commentsCount: Int?
}

extension ReviewInfo: Argo.Decodable {
    static func decode(_ json: JSON) -> Decoded<ReviewInfo> {
        let reviewInfo = curry(ReviewInfo.init)
        return reviewInfo
            <^> json <|? "rating"
            <*> json <|? ["reviews", "review_text"]
            <*> json <|? ["reviews", "id"]
            <*> json <|? ["reviews", "rating_color"]
            <*> json <|? ["reviews", "review_time_friendly"]
            <*> json <|? ["reviews", "rating_text"]
            <*> json <|? ["reviews", "timestamp"]
            <*> json <|? ["reviews", "likes"]
            <*> json <|? ["reviews", "user"]
            <*> json <|? ["reviews", "comments_count"]
    }
}


//MARK: - PhotosInfo
struct PhotosInfo {
    var id: String?
    var url: String?
    var thumbUrl: String?
    var user: UserInfo?
    var resID: Int?
    var caption: String?
    var timestamp: Int?
    var friendlyTime: String?
    var width: Int?
    var height: Int?
}

extension PhotosInfo: Argo.Decodable {
    static func decode(_ json: JSON) -> Decoded<PhotosInfo> {
        let photosInfo = curry(PhotosInfo.init)
        return photosInfo
            <^> json <|? "id"
            <*> json <|? "url"
            <*> json <|? "thumb_url"
            <*> json <|? "user"
            <*> json <|? "res_id"
            <*> json <|? "caption"
            <*> json <|? "timestamp"
            <*> json <|? "friendly_time"
            <*> json <|? "width"
            <*> json <|? "height"
    }
}

//MARK: - UserInfo
struct UserInfo {
    var name: String?
    var zomatoHandle: String?
    var foodieLevel: String?
    var foodieLevelNum: Int?
    var foodieColor: String?
    var profileUrl: String?
    var profileDeeplink: String?
    var profileImage: String?
}

extension UserInfo: Argo.Decodable {
    static func decode(_ json: JSON) -> Decoded<UserInfo> {
        let userInfo = curry(UserInfo.init)
        return userInfo
            <^> json <|? "name"
            <*> json <|? "zomato_handle"
            <*> json <|? "foodie_level"
            <*> json <|? "foodie_level_num"
            <*> json <|? "foodie_color"
            <*> json <|? "profile_url"
            <*> json <|? "profile_deeplink"
            <*> json <|? "profile_image"
    }
}
