//
//  URLFormatter.swift
//  walter
//
//  Created by Heath Borders on 8/28/21.
//

import Foundation

class URLFormatter: Formatter {
    private let validator: (URL) -> Bool
    
    convenience override init() {
        self.init(validator: { _ in true })
    }
    
    init(validator: @escaping (URL) -> Bool) {
        self.validator = validator
        
        super.init()
    }
    
    required init(coder: NSCoder) {
        abort()
    }
    
    override func string(for obj: Any?) -> String? {
        if let url = obj as? URL {
            return url.absoluteString
        } else {
            return ""
        }
    }
    
    override func getObjectValue(
        _ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?,
        for string: String,
        errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?
    ) -> Bool {
        let url =  NSURL(string: string)
        let valid: Bool = url.map { validator($0 as URL) } ?? false
        
        obj?.pointee = valid ? url : nil
        return true
    }
}
