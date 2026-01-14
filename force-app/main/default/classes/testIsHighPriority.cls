@IsTest
private class TestIsHighPriority {
  @TestSetup
  static void loadTestData() {
    // GIVEN
    Account acct = new Account(Name = 'ACME');
    insert acct;
    List<Opportunity> opps = TestFactory.generateOppsForAccount(acct.id, 1000.00, 5);
    insert opps;
  }
  @IsTest
  static void shouldReturnHighPriorityWhenOpportunitiesExceedThreshold() {
    // WHEN
    Account acct = [SELECT Id FROM Account LIMIT 1];
    AccountWrapper acctWrapper = new AccountWrapper(acct);
    // THEN
    Test.startTest();
      Assert.areEqual(
        100000.00,
        acctWrapper.isHighPriority(),
        'Expected to get 100000.00');
    Test.stopTest();
  }
}
