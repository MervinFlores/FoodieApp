//
//  Restaurant.swift
//  FoodieApp
//
//  Created by Mervin Flores on 8/23/19.
//  Copyright © 2019 Mervin Flores. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

struct RestaurantsBean{
    var results_found: Int?
    var results_start: Int?
    var results_shown: Int?
    var restaurants: [Restaurant]?
}

extension RestaurantsBean: Argo.Decodable {
    static func decode(_ json: JSON) -> Decoded<RestaurantsBean> {
        let restaurantsBean = curry(RestaurantsBean.init)
        return restaurantsBean
            <^> json <|? "results_found"
            <*> json <|? "results_start"
            <*> json <|? "results_shown"
            <*> json <||? "restaurants"
    }
}

struct Restaurant {
    var id: Int?
    var name: String?
    var url: String?
    var location: LocationInfo?
    var average_cost_for_two: String?
    var price_range: String?
    var currency: String?
    var thumb: String?
    var featured_image: String?
    var events_url: String?
    var user_rating: UserRating?
    var has_online_delivery: Int?
    var is_delivering_now: Int?
    var photos: [PhotosInfo]?
    var all_reviews: [ReviewInfo]?
    var has_table_booking: Int?
    var cuisines: String?
    var all_reviews_count: Int?
    var photo_count: Int?
    var phoneNumbers: String?
}

extension Restaurant: Argo.Decodable {
    static func decode(_ json: JSON) -> Decoded<Restaurant> {
        let has_online_delivery: Decoded<[ReviewInfo]?> = json <||? "all_reviews"
        
        let restaurant = curry(Restaurant.init)
            <^> json <|? "id"
            <*> json <|? "name"
            <*> json <|? "url"
            <*> json <|? "location"
            <*> json <|? "average_cost_for_two"
            <*> json <|? "price_range"
            <*> json <|? "currency"
            <*> json <|? "thumb"
            <*> json <|? "featured_image"
            <*> json <|? "events_url"
            <*> json <|? "user_rating"
            <*> json <|? "has_online_delivery"
            <*> json <|? "is_delivering_now"
            <*> json <||? "photos"
            <*> has_online_delivery
        
        return restaurant
            <*> json <|? "has_table_booking"
            <*> json <|? "cuisines"
            <*> json <|? "all_reviews_count"
            <*> json <|? "photo_count"
            <*> json <|? "phoneNumbers"
    }
}
