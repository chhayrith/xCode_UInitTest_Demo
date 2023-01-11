//
//  MovieMangerr.swift
//  TodoList
//
//  Created by liem on 11/1/23.
//

import Foundation

class MovieManger{
    var moviesToSeeCount: Int { return movieToSeeArray.count }
    var moviesSeenCount: Int { return moviesSeenArray.count }
    
    private var movieToSeeArray = [Movie]()
    private var moviesSeenArray = [Movie]()
    
    func addMovie(movie: Movie){
//        moviesToSeeCount += 1
        
        if !movieToSeeArray.contains(movie){
            movieToSeeArray.append(movie)
        }
    }
    
    func movieAtIndex(index: Int) -> Movie{
        return movieToSeeArray[index]
    }
    
    func checkOffMovieAtIndex(index: Int){
        guard index < moviesToSeeCount else { return }
        
//        moviesToSeeCount -= 1
//        moviesSeenCount += 1
        let checkedmovie = movieToSeeArray.remove(at: index)
        moviesSeenArray.append(checkedmovie)
    }
    
    func checkedOffMovieAtIndex(index: Int) -> Movie{
        return moviesSeenArray[index]
    }
    
    func clearArrays(){
        moviesSeenArray.removeAll()
        movieToSeeArray.removeAll()
    }
}
