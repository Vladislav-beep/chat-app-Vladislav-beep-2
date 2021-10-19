//
//  LocalStorageManager.swift
//  Chat
//
//  Created by Владислав Сизонов on 19.10.2021.
//

import UIKit


class LocalStorageManager {
    
    func writeToLocalFile(writeString: String, fileName: String) {
        
        guard let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(fileName).appendingPathExtension("txt") else { return }
        
        do {
            try writeString.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            print(error)
        }
        
    }
    
    func readFromLocalFile(from fileName: String) -> String {
        var readString = ""
        
        guard let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(fileName).appendingPathExtension("txt") else { return "" }
        do {
            readString = try String(contentsOf: url)
        } catch {
            print(error)
        }
        return readString
    }
    
    func saveProfileImageToLocalFile(image: UIImage) {
        guard let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("savedProfileImage.png") else { return }
        
        if let data = image.pngData() {
            do {
                try data.write(to: url)
            } catch {
                print("Unable to Write Image Data to Disk")
            }
            
        }
        
    }
    
    func downloadImageFromLocalFile() -> UIImage? {
        guard let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("savedProfileImage.png") else { return nil }
        
        guard let data = try? Data(contentsOf: url) else { return nil }
        let image = UIImage(data: data)
        return image
    }
}
