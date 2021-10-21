//
//  ProfileDataManagerGCD.swift
//  Chat
//
//  Created by Владислав Сизонов on 21.10.2021.
//

import UIKit

typealias GetProfileResponse = Result<Profile, FileManagerError>

struct Profile: Codable {
    let fullName: String?
    let description: String?
    let avatarImageData: Data?
}

enum FileManagerError: Error {
    case writeError
    case readError
    var message: String {
        switch self {
        case .writeError:
            return "Ошибка записи"
        case .readError:
            return "Ошибка чтения"
        }
    }
}

final class ProfileDataManager {

    enum DataType: String {
        case settings
        case profile

        var key: String {
            self.rawValue.capitalized
        }
    }

    private let dataType = DataType.profile
    private let profileKey = "Profile"

    let myQueue = DispatchQueue(label: "ProfileDataManager", attributes: .concurrent)

    // MARK: - Public methods

    func getValue<Value: Decodable>(completion: @escaping (Result<Value, FileManagerError>) -> Void) {

        myQueue.async {
            guard let fileDirectory = self.fileDirectory(for: self.dataType) else { return completion(.failure(.readError)) }
            do {
                let data = try Data(contentsOf: fileDirectory)
                let dictionary = try PropertyListDecoder().decode([String: Value].self, from: data)
                guard let value = dictionary[self.profileKey] else { return completion(.failure(.readError)) }
                return  completion(.success(value))
            } catch {
                return completion(.failure(.readError))
            }
        }
    }

    func saveValue<Value: Encodable>(_ value: Value, completion: @escaping (Result<String, FileManagerError>) -> Void) {
        
        myQueue.async { [ weak self] in
            guard let self = self else { return completion(.failure(.writeError)) }
            guard let fileDirectory = self.fileDirectory(for: self.dataType) else { return completion(.failure(.writeError)) }
            do {
                let data = try PropertyListEncoder().encode([self.profileKey: value])
                try data.write(to: fileDirectory, options: .noFileProtection)
                return completion(.success("Данные успешно сохранены"))
            } catch {
                return completion(.failure(.writeError))
            }
        }
    }

    // MARK: - Private methods

    private func fileDirectory(for dataType: DataType) -> URL? {
        guard let folderDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        print(folderDirectory)
        return folderDirectory.appendingPathComponent(dataType.key).appendingPathExtension("plist")
    }
}

