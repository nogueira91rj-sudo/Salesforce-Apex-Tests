@IsTest
private class AccountWrapperTests {
    
  @TestSetup
  static void loadTestData() {
    // GIVEN
    Account acct = new Account(Name = 'ACME');
    insert acct;
    List<Opportunity> opps = TestFactory.generateOppsForAccount(acct.id, 1000.00, 5);
    insert opps;
      
    Account acct2 = new Account(Name = 'ACME2');
    insert acct2;
    List<Opportunity> opps2 = TestFactory.generateOppsForAccount(acct2.id, 200600.00, 5);
    insert opps2;
  }
    
  @IsTest
  static void testPositiveRoundedAveragePrice() {
    // WHEN
    Account acct = [SELECT Id FROM Account LIMIT 1];
    AccountWrapper acctWrapper = new AccountWrapper(acct);
    // THEN
    Test.startTest();
      Assert.areEqual(
        1000.00,
        acctWrapper.getRoundedAvgPriceOfOpps(),
        'Expected to get 1000.00');
    Test.stopTest();
  }

  @IsTest
  static void testIsHighPriority(){
    // WHEN
    Account acct = [SELECT Id FROM Account where name = 'ACME2'];
    AccountWrapper acctWrapper = new AccountWrapper(acct);
    // THEN
    Test.startTest();
      Assert.areEqual(
        true,
        acctWrapper.isHighPriority(),
        'Expected the average greater than 100000.00');
    Test.stopTest();
  }
}