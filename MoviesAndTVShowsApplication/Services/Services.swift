//
//  Services.swift
//  MoviesAndTVShowsApplication
//
//  Created by Yasemin TOK on 24.01.2022.
//

import Foundation
import Alamofire

protocol ServicesProtocol {
    func topRatedMovies(onSuccess: @escaping ([Result]?) -> Void, onError: @escaping (AFError) -> Void)
    func nowPlayingMovies(onSuccess: @escaping ([Result]?) -> Void, onError: @escaping (AFError) -> Void)
    func popularMovies(onSuccess: @escaping ([Result]?) -> Void, onError: @escaping (AFError) -> Void)
    func fetchAllMoviesDetails(movieID: Int, onSuccess: @escaping (MoviesDetails?) -> Void, onError: @escaping (AFError) -> Void)
    func fetchAllCastDetails(movieID: Int, onSuccess: @escaping ([MoviesCast]?) -> Void, onError: @escaping (AFError) -> Void)
}

final class Services: ServicesProtocol {
    func topRatedMovies(onSuccess: @escaping ([Result]?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Path.NetworkPath.BASE_URL + Path.FirebasePath.TOP_RATED + Path.NetworkPath.API_KEY, parameters: nil, data: nil, method: HTTPMethod.get) { (response: Movies) in
            onSuccess(response.results)
            print(response)
        } onError: { error in
            onError(error)
            print(error)
        }
    }
    
    func nowPlayingMovies(onSuccess: @escaping ([Result]?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Path.NetworkPath.BASE_URL + Path.FirebasePath.NOW_PLAYING + Path.NetworkPath.API_KEY, parameters: nil, data: nil, method: HTTPMethod.get) { (response: Movies) in
            onSuccess(response.results)
            print(response)
        } onError: { error in
            onError(error)
            print(error)
        }
    }
    
    func popularMovies(onSuccess: @escaping ([Result]?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Path.NetworkPath.BASE_URL + Path.FirebasePath.POPULAR + Path.NetworkPath.API_KEY, parameters: nil, data: nil, method: HTTPMethod.get) { (response: Movies) in
            onSuccess(response.results)
            print(response)
        } onError: { error in
            onError(error)
            print(error)
        }
    }
    
    func fetchAllMoviesDetails(movieID: Int, onSuccess: @escaping (MoviesDetails?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Path.NetworkPath.BASE_URL + "\(movieID)" + Path.NetworkPath.API_KEY, parameters: nil, data: nil, method: HTTPMethod.get) { (response: MoviesDetails) in
            onSuccess(response)
            print(response)
        } onError: { error in
            onError(error)
            print(error)
        }
    }
    
    func fetchAllCastDetails(movieID: Int, onSuccess: @escaping ([MoviesCast]?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Path.NetworkPath.BASE_URL + "\(movieID)" + Path.FirebasePath.CREDITS + Path.NetworkPath.API_KEY, parameters: nil, data: nil, method: HTTPMethod.get) { (response: MoviesCastModel) in
            onSuccess(response.cast)
            print(response)
        } onError: { error in
            onError(error)
            print(error)
        }
    }
}
