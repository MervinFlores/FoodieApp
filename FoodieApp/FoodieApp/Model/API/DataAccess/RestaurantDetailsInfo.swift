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
    var aggregateRating: Int?
    var ratingText: String?
    var ratingColor: String?
    var votes: String?
}

extension UserRating: Argo.Decodable {
    static func decode(_ json: JSON) -> Decoded<UserRating> {
        let userRating = curry(UserRating.init)
        return userRating
            <^> json <|? "aggregate_rating"
            <*> json <|? "rating_text"
            <*> json <|? "rating_color"
            <*> json <|? "votes"
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
            <*> json <|? "review_text"
            <*> json <|? "id"
            <*> json <|? "rating_color"
            <*> json <|? "review_time_friendly"
            <*> json <|? "rating_text"
            <*> json <|? "timestamp"
            <*> json <|? "likes"
            <*> json <|? "user"
            <*> json <|? "comments_count"
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
    var timestamp: Date?
    var friendlyTime: String?
    var width: Int?
    var height: Int?
    var commentsCount: Int?
    var likesCount: Int?
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
            <*> .optional(json <|? "timestamp" >>- TimeUtils.decodedDateFromTimestamp)
            <*> json <|? "friendly_time"
            <*> json <|? "width"
            <*> json <|? "height"
            <*> json <|? "comments_count"
            <*> json <|? "likes_count"
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
