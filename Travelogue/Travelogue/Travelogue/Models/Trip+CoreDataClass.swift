import UIKit
import CoreData

@objc(Trip)
public class Trip: NSManagedObject {
    
    var entries: [Entry]? {
        return self.rawEntries?.array as? [Entry]
    }
    
    convenience init?(title: String?, contents: String?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Trip.entity(), insertInto: managedContext)
        
        self.title = title
        self.contents = contents
    }
}
