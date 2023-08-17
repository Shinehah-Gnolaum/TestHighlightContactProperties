
import Foundation
import Contacts
import ContactsUI

// MARK: public let contactIdentifierKeyOnlyInArray:

public let contactIdentifierKeyOnlyInArray: [CNKeyDescriptor] = [CNContactIdentifierKey] as [CNKeyDescriptor]

// MARK: public let contactIdentificationKeys:

public let contactIdentificationKeys: [CNKeyDescriptor] = [CNContactIdentifierKey, CNContactTypeKey, CNContactPropertyAttribute] as [CNKeyDescriptor]

// MARK: public let contactNameKeys:

public let contactNameKeys: [CNKeyDescriptor] = [CNContactNamePrefixKey, CNContactGivenNameKey, CNContactMiddleNameKey, CNContactFamilyNameKey, CNContactPreviousFamilyNameKey, CNContactNameSuffixKey, CNContactNicknameKey, CNContactPhoneticGivenNameKey, CNContactPhoneticMiddleNameKey, CNContactPhoneticFamilyNameKey] as [CNKeyDescriptor]

// MARK: public let contactBirtdayKey:

public let contactBirtdayKey: [CNKeyDescriptor] = [CNContactBirthdayKey] as [CNKeyDescriptor]

// MARK: public let contactWorkKeys:

public let contactWorkKeys: [CNKeyDescriptor] = [CNContactJobTitleKey, CNContactDepartmentNameKey, CNContactOrganizationNameKey, CNContactPhoneticOrganizationNameKey] as [CNKeyDescriptor]

// MARK: public let contactPostalAddressesKey:

public let contactPostalAddressesKey: [CNKeyDescriptor] = [CNContactPostalAddressesKey] as [CNKeyDescriptor]

// MARK: public let contactPhoneKey:

public let contactPhoneKey: [CNKeyDescriptor] = [CNContactPhoneNumbersKey] as [CNKeyDescriptor]

// MARK: public let contactInstantMessageAddressesKey:

public let contactInstantMessageAddressesKey: [CNKeyDescriptor] = [CNContactInstantMessageAddressesKey] as [CNKeyDescriptor]

// MARK: public let contactEmailAddressesKey:

public let contactEmailAddressesKey: [CNKeyDescriptor] = [CNContactEmailAddressesKey] as [CNKeyDescriptor]

// MARK: public let contacttUrlAddressesKey:

public let contacttUrlAddressesKey: [CNKeyDescriptor] = [CNContactUrlAddressesKey] as [CNKeyDescriptor]

// MARK: public let contactSocialProfilesKey:

public let contactSocialProfilesKey: [CNKeyDescriptor] = [CNContactSocialProfilesKey] as [CNKeyDescriptor]

// MARK: public let contactBirthdayKeys:

public let contactBirthdayKeys: [CNKeyDescriptor] = [CNContactBirthdayKey, CNContactNonGregorianBirthdayKey, CNContactDatesKey] as [CNKeyDescriptor]

// MARK: public let contactNotesKey:

public let contactNotesKey: [CNKeyDescriptor] = [CNContactNoteKey] as [CNKeyDescriptor]

// MARK: public let contactImagesKeys:

public let contactImagesKeys: [CNKeyDescriptor] = [CNContactImageDataKey, CNContactThumbnailImageDataKey, CNContactImageDataAvailableKey] as [CNKeyDescriptor]

// MARK: public let contactRelationshipsKey:

public let contactRelationshipsKey: [CNKeyDescriptor] = [CNContactRelationsKey] as [CNKeyDescriptor]

// MARK: public let contactGroupsAndContainersKeys:

public let contactGroupsAndContainersKeys: [CNKeyDescriptor] = [CNGroupNameKey, CNGroupIdentifierKey] + [CNContainerNameKey, CNContainerTypeKey] as [CNKeyDescriptor]
 
// MARK: public let contactInstantMessagingKeys:

public let contactInstantMessagingKeys: [CNKeyDescriptor] = [CNInstantMessageAddressServiceKey, CNInstantMessageAddressUsernameKey] as [CNKeyDescriptor]

// MARK: public let contactSocialProfileKeys

public let contactSocialProfileKeys: [CNKeyDescriptor] = [CNSocialProfileServiceKey, CNSocialProfileURLStringKey, CNSocialProfileUsernameKey, CNSocialProfileUserIdentifierKey] as [CNKeyDescriptor]

// MARK: -

// MARK: public let contactAddressesKeys:

public let contactAddressesKeys: [CNKeyDescriptor] = [CNContactPostalAddressesKey, CNContactEmailAddressesKey, CNContactUrlAddressesKey, CNContactInstantMessageAddressesKey] as [CNKeyDescriptor]

// MARK: public let contactPostalAddressKeys:

public let contactPostalAddressKeys: [CNKeyDescriptor] = {
    
    var contactPostalAddressKeys: [CNKeyDescriptor] = [CNPostalAddressCityKey, CNPostalAddressCountryKey, CNPostalAddressISOCountryCodeKey, CNPostalAddressPostalCodeKey, CNPostalAddressStateKey, CNPostalAddressStreetKey] as [CNKeyDescriptor]

    if #available(iOS 10.3, *) {
        contactPostalAddressKeys.append(contentsOf: [CNPostalAddressSubAdministrativeAreaKey, CNPostalAddressSubLocalityKey] as [CNKeyDescriptor])
        return contactPostalAddressKeys
    } else {
        return contactPostalAddressKeys
    }
    
}()


// MARK: -

// MARK: public let commonKeysToFetch:

public let commonKeysToFetch: [CNKeyDescriptor] = {
    
    var localCommonKeysToFetch: [CNKeyDescriptor] = [CNKeyDescriptor]()
    
    localCommonKeysToFetch.append(contentsOf: contactIdentificationKeys)
    localCommonKeysToFetch.append(contentsOf: contactNameKeys)
    localCommonKeysToFetch.append(contentsOf: contactWorkKeys)
    localCommonKeysToFetch.append(contentsOf: contactAddressesKeys)
    localCommonKeysToFetch.append(contentsOf: contactPhoneKey)
    localCommonKeysToFetch.append(contentsOf: contactEmailAddressesKey)
    localCommonKeysToFetch.append(contentsOf: contactSocialProfilesKey)
    localCommonKeysToFetch.append(contentsOf: contactBirthdayKeys)

    return localCommonKeysToFetch
}()

// MARK: public let thoroughKeysToFetch:

public let thoroughKeysToFetch: [CNKeyDescriptor] = {
    
    var localThoroughKeysToFetch: [CNKeyDescriptor] = [CNKeyDescriptor]()
    
    localThoroughKeysToFetch.append(contentsOf: commonKeysToFetch)
//    localThoroughKeysToFetch.append(contentsOf: contactNotesKey)
    localThoroughKeysToFetch.append(contentsOf: contactImagesKeys)
    localThoroughKeysToFetch.append(contentsOf: contactRelationshipsKey)

    return localThoroughKeysToFetch
}()

// MARK: -

// MARK: public let descriptorForRequiredKeysForFullName

public let descriptorForRequiredKeysForFullName: [CNKeyDescriptor] = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]

// MARK: public let descriptorForRequiredKeysForVCard:

public let descriptorForRequiredKeysForVCard: [CNKeyDescriptor] = [CNContactVCardSerialization.descriptorForRequiredKeys()] as! [CNKeyDescriptor]

// MARK: public let keysToFetchForVCard:

public let keysToFetchForVCard: [CNKeyDescriptor] = {
    
    var localKeysToFetchForVCard: [CNKeyDescriptor] = [CNKeyDescriptor]()
    
    localKeysToFetchForVCard.append(contentsOf: thoroughKeysToFetch)
    localKeysToFetchForVCard.append(contentsOf: descriptorForRequiredKeysForVCard)
    
    return localKeysToFetchForVCard as [CNKeyDescriptor]
    
}()

// MARK: contactFromMemberToolsKeys

public let contactFromMemberToolsKeys: [CNKeyDescriptor] = contactIdentifierKeyOnlyInArray + contactNameKeys

// MARK: CNContactViewController.descriptorForRequiredKeys()

public let contactViewControllerDescriptorForRequiredKeys: [CNKeyDescriptor] = [CNContactViewController.descriptorForRequiredKeys()]

// MARK: commonKeysToFetchWithCNContactViewControllerDescriptorForRequiredKeys - commonKeysToFetch + CNContactViewController.descriptorForRequiredKeys()

public let commonKeysToFetchForCNContactViewController: [CNKeyDescriptor] = commonKeysToFetch + contactViewControllerDescriptorForRequiredKeys

// MARK: public let thoroughKeysToMerge:

public let thoroughKeysToMerge: [CNKeyDescriptor] = {
    
    var localKeysToMerge: [CNKeyDescriptor] = [CNKeyDescriptor]()
    
    localKeysToMerge.append(contentsOf: descriptorForRequiredKeysForFullName)
    localKeysToMerge.append(contentsOf: thoroughKeysToFetch)
    localKeysToMerge.append(contentsOf: contactNameKeys)
    localKeysToMerge.append(contentsOf: contactAddressesKeys)
    localKeysToMerge.append(contentsOf: contactPhoneKey)
    localKeysToMerge.append(contentsOf: contactWorkKeys)
    localKeysToMerge.append(contentsOf: contactBirtdayKey)
    localKeysToMerge.append(contentsOf: descriptorForRequiredKeysForVCard)
    localKeysToMerge.append(contentsOf: contactViewControllerDescriptorForRequiredKeys)
//    localKeysToMerge.append(contentsOf: contactNotesKey)

    return localKeysToMerge
}()


