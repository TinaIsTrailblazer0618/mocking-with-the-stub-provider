@isTest
private class StubExample_Tests {
    @isTest
    static void testGetIsTruePositive() {
        StubExample example = new StubExample();
        Test.startTest();
        Boolean results = example.getIsTrue();
        Test.stopTest();

        System.assert(
            results == false, 
            'Expected to get false back from unmodified newly constructed instance.'
        );
    }

    @isTest
    static void testGetGreetingPositive() {
        StubExample example = new StubExample();
        Test.startTest();
        String results = example.getGreeting();
        Test.stopTest();

        System.assertEquals(
            'hello', results, 'Expected to find hello.');
    }

    @isTest
    static void testSetGreetingStringPositive() {
        StubExample example = new StubExample();
        Test.startTest();
        example.setGreeting('testing 123');
        String results = example.getGreeting();
        Test.stopTest();

        System.assertEquals(
            'testing 123', results, 'expected to find testing 123.');
    }

    @isTest
    static void testSetGreetingIntegerPositive() {
        StubExample example = new StubExample();
        Test.startTest();
        example.setGreeting(1);
        String results = example.getGreeting();
        Test.stopTest();

        System.assertEquals(
            '1', results, 'Expected to find 1.');
    }
}
