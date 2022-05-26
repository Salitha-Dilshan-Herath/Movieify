//
//  FavMovie+CoreDataProperties.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-27.
//
//

import Foundation
import CoreData


extension FavMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavMovie> {
        return NSFetchRequest<FavMovie>(entityName: "FavMovie")
    }

    @NSManaged public var adult: Bool
    @NSManaged public var backdropPath: String?
    @NSManaged public var genres: String?
    @NSManaged public var id: Int64
    @NSManaged public var originalLanguage: String?
    @NSManaged public var originalTitle: String?
    @NSManaged public var overview: String?
    @NSManaged public var popularity: Float
    @NSManaged public var posterPath: String?
    @NSManaged public var releaseDate: Date?
    @NSManaged public var title: String?
    @NSManaged public var voteAverage: Float
    @NSManaged public var voteCount: Int64

}

extension FavMovie : Identifiable {

}
