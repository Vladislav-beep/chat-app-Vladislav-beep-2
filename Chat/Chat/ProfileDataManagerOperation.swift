//
//  ProfileDataManagerOperation.swift
//  Chat
//
//  Created by Владислав Сизонов on 21.10.2021.
//

import UIKit

final class ProfileDataManagerOperation {
    
    enum DataType: String {
        case settings
        case profile
        
        var key: String {
            self.rawValue.capitalized
        }
    }
    
    private let dataType = DataType.profile
    private let profileKey = "Profile"
    
    private let operationQueue = OperationQueue()
    private let operation = LoadOperation()
    
    // MARK: - Public methods
    
    func getValue<Value: Decodable>(completion: @escaping (Result<Value, FileManagerError>) -> Void) {
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
    
    public func saveValue<Value: Encodable>(_ value: Value, completion: @escaping (Result<String, FileManagerError>) -> Void) {
        operation.setTask {
            guard let fileDirectory = self.fileDirectory(for: self.dataType) else { return completion(.failure(.writeError)) }
            do {
                let data = try PropertyListEncoder().encode([self.profileKey: value])
                try data.write(to: fileDirectory, options: .noFileProtection)
                return completion(.success("Данные успешно сохранены"))
            } catch {
                return completion(.failure(.writeError))
            }
        }
        operationQueue.addOperation(operation)
    }
    
    // MARK: - Private methods
    
    private func fileDirectory(for dataType: DataType) -> URL? {
        guard let folderDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        print(folderDirectory)
        return folderDirectory.appendingPathComponent(dataType.key).appendingPathExtension("plist")
    }
}

class LoadOperation: Operation {
    var task: (() -> Void)?
    
    func setTask(task: @escaping () -> Void) {
        self.task = task
    }
    
    override func main() {
        if isCancelled {
            print("Operation is finished")
            return
        }
        task?()
    }
}
