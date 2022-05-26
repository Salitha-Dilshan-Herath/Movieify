//
//  CoreDataManager.swift
//  Movieify
//
//  Created by Spemai-Macbook on 2022-05-26.
//

import Foundation
import UIKit
import CoreData

struct CoreDataManager {
    
    private var appDelegate: AppDelegate?
    private var manageContent: NSManagedObjectContext?
    
    init() {
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.appDelegate = appDelegate
            self.manageContent     = self.appDelegate!.persistentContainer.viewContext
        }
        
    }
    
    //MARK: - Category Functions
    func saveFavMovie(movie: FavouriteMovie,  completion: @escaping (Bool) -> Void) {
        
        let FavMovieEntity    = NSEntityDescription.entity(forEntityName: "FavMovie", in: self.manageContent!)!
        let favMovie          = NSManagedObject(entity: FavMovieEntity, insertInto: manageContent)
        
        favMovie.setValue(movie.releaseDate, forKey: "releaseDate")
        favMovie.setValue(movie.adult, forKey: "adult")
        favMovie.setValue(movie.backdropPath, forKey: "backdropPath")
        favMovie.setValue(movie.genreIds, forKey: "genres")
        
        favMovie.setValue(movie.originalLanguage, forKey: "originalLanguage")
        favMovie.setValue(movie.originalTitle, forKey: "originalTitle")
        favMovie.setValue(movie.overview, forKey: "overview")
        favMovie.setValue(movie.posterPath, forKey: "posterPath")
        
        favMovie.setValue(movie.title, forKey: "title")
        favMovie.setValue(movie.popularity, forKey: "popularity")
        favMovie.setValue(movie.voteAverage, forKey: "voteAverage")
        favMovie.setValue(movie.id, forKey: "id")
        favMovie.setValue(movie.voteCount, forKey: "voteCount")
       
        do {
            try self.manageContent!.save()
            
            completion(true)
            
        } catch _ as NSError {
            
            completion(true)            
        }
    }
    
    func deleteFavMovie(id: Int, completion: @escaping (Bool) -> Void) {
        
        let fetchRequest : NSFetchRequest<FavMovie> = FavMovie.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        
        do {
            
            let result = try self.manageContent!.fetch(fetchRequest)
            
            result.forEach{ movie in
                self.manageContent!.delete(movie)
            }
            
            try self.manageContent!.save()
            completion(true)
            
        } catch _ as NSError {
            completion(false)
        }
        
    }
    
    func getCategoryList() -> [NSManagedObject]  {

        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "FavMovie")

        do {
            let result = try self.manageContent!.fetch(fetch)

            return (result as? [NSManagedObject] ?? [NSManagedObject]())

        } catch {

            print("Failed")
            return [NSManagedObject]()
        }
    }

    func getFavMovie(id: String) -> [FavMovie]? {

        let fetchRequest : NSFetchRequest<FavMovie> = FavMovie.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)

        do {
            let result = try self.manageContent!.fetch(fetchRequest)

            return (result as [FavMovie])


        } catch (let error){

            print("Error on fav movie get: \(error.localizedDescription)")
            return nil
        }
    }
    
    func isFavMovieExists(id: Int) -> Bool {
        let fetchRequest: NSFetchRequest<FavMovie> = FavMovie.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)

        var entitiesCount = 0

        do {
            entitiesCount = try self.manageContent!.count(for: fetchRequest)
        }
        catch {
            print("error executing fetch request: \(error)")
        }

        return entitiesCount > 0
    }
    
  
}
