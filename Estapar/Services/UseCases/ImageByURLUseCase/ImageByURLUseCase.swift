//
//  ImageByURLUseCase.swift
//  Estapar
//
//  Created by Lucas on 19/07/24.
//

import Foundation
import UIKit

class ImageByURLUseCase {
    
    // MARK: - Internal Function
    
    func internalGetImage(url: String, completion: @escaping (Result<ImageByURLUseCaseResponse, NetworkOperationError>) -> Void) {
        guard let urlImage = URL(string: url) else {
            completion(.failure(.noBaseURL))
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlImage) { data, response, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            guard let image = UIImage(data: data) else {
                completion(.failure(.erroParsable))
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(ImageByURLUseCaseResponse(image: image)))
            }
        }
    
        task.resume()
    }
}

// MARK: - Extensions

extension ImageByURLUseCase: ImageByURLUseCaseProtocol {
    func getImage(url: String, completion: @escaping (Result<ImageByURLUseCaseResponse, NetworkOperationError>) -> Void) {
        internalGetImage(url: url, completion: completion)
    }
}
