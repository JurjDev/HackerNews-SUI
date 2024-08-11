//
//  NewsApiRepository.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case dataError
    case decodingError
}

protocol NewsApiRepositoryProtocol {
    func fetchNews() async -> Result<[NewsEntryResponse], NetworkError>
}

struct NewsApiRepository: NewsApiRepositoryProtocol {
    func fetchNews() async -> Result<[NewsEntryResponse], NetworkError> {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        guard let url = URL(string: APIEndpoint.hackerNews.urlString)
        else {
            return .failure(.urlError)
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                let result = try decoder.decode(HackerNewsResponse.self, from: data)
                return .success(result.hits)
            } catch {
                return .failure(.decodingError)
            }
        } catch {
            return .failure(.dataError)
        }
    }
}
