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
    var resultsFound: Int?
    var resultsStart: Int?
    var resultsShown: Int?
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
    var id: String?
    var name: String?
    var url: String?
    var location: LocationInfo?
    var averageCostForTwo: Int?
    var priceRange: Int?
    var currency: String?
    var thumb: String?
    var featuredImage: String?
    var eventsUrl: String?
    var userRating: UserRating?
    var hasOnlineDelivery: Int?
    var isDeliveringNow: Int?
    var photos: [PhotosInfo]?
    var allReviews: [ReviewInfo]?
    var hasTableBooking: Int?
    var cuisines: String?
    var allReviewsCount: Int?
    var phoneNumbers: String?
    var timings: String?
}

extension Restaurant: Argo.Decodable {
    static func decode(_ json: JSON) -> Decoded<Restaurant> {
        let has_online_delivery: Decoded<[ReviewInfo]?> = json <||? ["restaurant", "reviews"]
        
        let restaurant = curry(Restaurant.init)
            <^> json <|? ["restaurant", "id"]
            <*> json <|? ["restaurant", "name"]
            <*> json <|? ["restaurant", "url"]
            <*> json <|? ["restaurant", "location"]
            <*> json <|? ["restaurant", "average_cost_for_two"]
            <*> json <|? ["restaurant", "price_range"]
            <*> json <|? ["restaurant", "currency"]
            <*> json <|? ["restaurant", "thumb"]
            <*> json <|? ["restaurant", "featured_image"]
            <*> json <|? ["restaurant", "events_url"]
            <*> json <|? ["restaurant", "user_rating"]
            <*> json <|? ["restaurant", "has_online_delivery"]
            <*> json <|? ["restaurant", "is_delivering_now"]
            <*> json <||? ["restaurant", "photos"]
            <*> has_online_delivery
        
        return restaurant
            <*> json <|? ["restaurant", "has_table_booking"]
            <*> json <|? ["restaurant", "cuisines"]
            <*> json <|? ["restaurant", "all_reviews_count"]
            <*> json <|? ["restaurant", "phone_numbers"]
            <*> json <|? ["restaurant", "timings"]
    }
}
