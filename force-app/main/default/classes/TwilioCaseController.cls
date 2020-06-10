public with sharing class TwilioCaseController {

    public static Case createRecords(String phone) {
        Contact cont = TwilioHelper.fetchContact(phone);
        return TwilioHelper.createCase(cont);
    }

}