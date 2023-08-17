
import UIKit
import Contacts
import ContactsUI

class ViewController: UIViewController {

    var contact: CNContact! = nil
    let contactStore = CNContactStore()
    var contactViewController: CNContactViewController! = nil

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("#", #function)
        
        self.contactStore.requestAccess(for:.contacts) {
            response, error in
            
            DispatchQueue.main.async {
                if let error = error {
                    print("error: \(error.localizedDescription)")
                }
            }
            
            if response {
                
                DispatchQueue.main.async {
                    
                    let predicateForContactsMatchingEmailAddress = CNContact.predicateForContacts(matchingEmailAddress: "xxxxx@xxxx.xxx") // MARK: <--// **** Put email address here. ****
                    do {
                        let contactFetchRequest = CNContactFetchRequest(keysToFetch: thoroughKeysToMerge)
                        contactFetchRequest.predicate = predicateForContactsMatchingEmailAddress
                        contactFetchRequest.unifyResults = false
                        try self.contactStore.enumerateContacts(with: contactFetchRequest) {
                            contact, stop in
                            self.contact = contact
                            print("self.contact = contact")
                            stop.pointee = true
                        }
                        
                        self.showContactViewController()
                        
                    } catch {
                        
                        print("catch error: \(error.localizedDescription)")
                        
                    }
                    
                } // DispatchQueue.main.async {...}
                
            } // if response { }
            
        }
        
    }
    

}

extension ViewController {
    
    func showContactViewController() {
        
        self.contactViewController = CNContactViewController(for: self.contact)
        
        self.contactViewController.contactStore = self.contactStore
        
        self.contactViewController.allowsEditing = true
        
        self.contactViewController.allowsActions = false
        
        self.contactViewController.displayedPropertyKeys = thoroughKeysToFetch
        
        for key in thoroughKeysToFetch {
            print("key: \(key)")
            self.contactViewController.highlightProperty(withKey: key as! String, identifier: nil)
        }
        
        for emailAddress in self.contact.emailAddresses {
            print("emailAddress: \(emailAddress)")
            self.contactViewController.highlightProperty(withKey: CNContactEmailAddressesKey, identifier: emailAddress.identifier)
        }
        
        self.navigationController!.pushViewController(self.contactViewController, animated: true)
        
        DispatchQueue.main.async {
            self.contactViewController.view.setNeedsDisplay()
        }
        
        print("subviews count: \(self.contactViewController.view.subviews.count)")
        
    }

}
