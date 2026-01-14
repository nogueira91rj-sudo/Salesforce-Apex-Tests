@IsTest
private class CalculatorTests {

    @IsTest
    static void testDivideByZero() {
        // GIVEN
        Boolean exceptionThrown = false;

        // WHEN
        try {
            Calculator.divide(10, 0);
        } catch (Calculator.CalculatorException ex) {
            exceptionThrown = true;
            // THEN
            Assert.areEqual(
                'You still can\'t divide by zero',
                ex.getMessage(),
                'Expected divide by zero exception message'
            );
        }

        // FINAL ASSERT
        Assert.isTrue(
            exceptionThrown,
            'Expected CalculatorException to be thrown when dividing by zero'
        );
    }
}
