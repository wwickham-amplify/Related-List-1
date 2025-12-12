@isTest
public with sharing class EmailDataProviderTest {
    @isTest
    static void testGetEmail() {
        Test.startTest();
        EmailMessage result = EmailDataProvider.getEmail('12345');
        Test.stopTest();
    }

    @isTest
    static void testGetEmailNoId() {
        Test.startTest();
        EmailMessage result = EmailDataProvider.getEmail('');
        Test.stopTest();
    }
}