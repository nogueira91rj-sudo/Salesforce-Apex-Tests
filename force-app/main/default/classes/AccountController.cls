public with sharing class AccountController {
    public static List <Account> getAllActiveAccounts() {
        return [SELECT Id, name, Active__c FROM Account Where Active__c = 'Yes' WITH SECURITY_ENFORCED];
    }
}