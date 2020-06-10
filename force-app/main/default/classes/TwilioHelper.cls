public  class TwilioHelper {

    public static Contact fetchContact(String phoneNumber) {
        //Fetch information about contact, modify query if needed
        if(phoneNumber == null) {
            return null;
        }
        List<Contact> contactList = [Select Id, Firstname from Contact where MobilePhone =: phoneNumber OR Phone =: phoneNumber limit 1];
        return contactList.size() > 0 ? contactList[0] : createContact(phoneNumber);
    }

    public static Contact createContact(String phoneNumber)  {
        Contact cont = new Contact(
            LastName = 'Unknown',
            Phone = phoneNumber
        );
        insert cont;
        return cont;
    }

    public static Case createCase(Contact cont)  {
        Case cas = new Case(
            ContactId = cont.Id
        );
        insert cas;
        return cas;
    }

}